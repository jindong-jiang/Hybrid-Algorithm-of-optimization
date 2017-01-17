function  [Resolution Hauteur_Recepteur Largeur_Recepteur Helio CS NomHel Angle_Solaire Angle_Recepteur Distance_Hel_Rec SIGtot Puisance] = calcul_cdf (jour,heure,Resolution)
    %% Résumé : Calcul les cartes de flux pour un champ d'héliostat 
    x=1;y=2;z=3;

    %% Point détude
    lattitude=42.5; % lattitude du point d'étude
    DNI=1000; % Direct Normal Irradiance (W/m²)
    SIGsun=2.73*10^-3; % Ecart type de distribution de la puissance de l'astre solaire (rad)

    %% Calcul du vecteur solaire
    [Vsun(x),Vsun(y),Vsun(z)]= calcul_vecteur_solaire(heure,jour,lattitude);

    %% Le recepteur
    Prec(x)=0;                          % coordonnée x du centre du recepteur dans le repère global
    Prec(y)=8.4;                        % coordonnée y du centre du recepteur dans le repère global
    Prec(z)=80.8;                       % coordonnée z du centre du recepteur dans le repère global
    Largeur_Recepteur=5;                % largeur du recepteur (m)
    Hauteur_Recepteur=5;                % Hauteur du recepteur (m)
    Angle_Recepteur=20;                 % Angle Vrec/axe y (orienté vers le CS)
    Vrec(x)=0;                          % coordonnée x du vecteur normal du récepteur dans le repère global
    Vrec(y)=cosd(Angle_Recepteur);  % coordonnée y du vecteur normal du récepteur dans le repère global
    Vrec(z)=-sind(Angle_Recepteur); % coordonnée z du vecteur normal du récepteur dans le repère global
    [Vrec(x),Vrec(y),Vrec(z)]=normalisation(Vrec(x),Vrec(y),Vrec(z));%normalisation du vecteur récepteur

    %% Le Champ d'héliostat
    [CS NomHel]=definition_champ_solaire();
    Nbre_Heliostats=size(NomHel,1);% Nombre d'héliostats dans le champs
    Vhel_rec=zeros(3,1);
    Vhel=zeros(3,1);
    Angle_Solaire=zeros(Nbre_Heliostats,1);
    Angle_Recepteur=zeros(Nbre_Heliostats,1);
    Distance_Hel_Rec=zeros(Nbre_Heliostats,1);
    Puisance=zeros(Nbre_Heliostats,1);
    SIGtot=zeros(Nbre_Heliostats,1);

    %% Le calcul du flux
    % Resolution=10; % maillage du récepteur
    Pvis=zeros(3,1); % Le point de visé dans le repère du récepteur

    %% Les héliostats
    Lhel=8;     %largeur des héliostats (m)
    Hhel=8;     %hauteur des héliostats (m)
    Rhel=0.9;   %ratio entre la surface réfléchissante et Lhel*Hhel
    SIGm=1.5*10^-3;   %erreur macro en mRad
    SIGel=0.5*10^-3;  %erreur tracking élévation (rad)
    SIGaz=0.5*10^-3;  %erreur tracking azimuth (rad)
    REFhel=0.95; %réflectivité des héliostats

    Helio=zeros(Resolution,Resolution,Nbre_Heliostats); % Les cartes de flux

    %% Boucle de calcul du flux pour chaque héliostat
    for H_ETUDIE=1:Nbre_Heliostats

        disp(NomHel(H_ETUDIE,:)); % Affiche l'héliostat en cours de traitement

        %% Calcul du vecteur héliostat-récepteur
        Vhel_rec(x)=Prec(x)-CS(H_ETUDIE,x);%coordonnée x du vecteur heliostat-récepteur
        Vhel_rec(y)=Prec(y)-CS(H_ETUDIE,y);%coordonnée y du vecteur héliostat-récepteur
        Vhel_rec(z)=Prec(z)-CS(H_ETUDIE,z);%coordonnée y du vecteur héliostat-récepteur
        Distance_Hel_Rec(H_ETUDIE)=norme(Vhel_rec(x),Vhel_rec(y),Vhel_rec(z));%distance héliostat-récepteur
        [Vhel_rec(x),Vhel_rec(y),Vhel_rec(z)]=normalisation(Vhel_rec(x),Vhel_rec(y),Vhel_rec(z));%normalisation du vecteur héliostat-récepteur

        %% Calcul du vecteur normal à l'héliostat
        Vhel(x)=Vhel_rec(x)-Vsun(x);%coordonnée x du vecteur normal héliostat
        Vhel(y)=Vhel_rec(y)-Vsun(y);%coordonnée y du vecteur normal héliostat
        Vhel(z)=Vhel_rec(z)-Vsun(z);%coordonnée z du vecteur normal héliostat
        [Vhel(x),Vhel(y),Vhel(z)]=normalisation(Vhel(x),Vhel(y),Vhel(z));%normalisation du vecteur héliostat    

        %% Angle solaire & angle récepteur
        Angle_Solaire(H_ETUDIE)=angle_2_vecteurs(-Vsun(x),-Vsun(y),-Vsun(z),Vhel(x),Vhel(y),Vhel(z));%angle solaire en °
        Angle_Recepteur(H_ETUDIE)=angle_2_vecteurs(-Vhel_rec(x),-Vhel_rec(y),-Vhel_rec(z),Vrec(x),Vrec(y),Vrec(z));%angle récepteur en °   

        %% Calcul de la puissance du flux fournit par l'héliostat au récepteur 
        % Pertes pat effet cosinus (inclinaison de l'héliostat par rapport à Vsun)
        Rendement_Helio_Cosinus=cosd(Angle_Solaire(H_ETUDIE));
        % Pertes liées attenuation atmosphérique (distance entre l'héliostat et le recepteur)
        Rendement_Helio_Atm=calcul_rendement_attenuation(Distance_Hel_Rec(H_ETUDIE));
        % Puissance incidente au récepteur
        Puisance(H_ETUDIE)=DNI*REFhel*Rhel*Hhel*Lhel*Rendement_Helio_Cosinus*Rendement_Helio_Atm; % en W

        %% Calcul de la distribution de cette puissance sur le récepteur

        % distribution de l'erreur liée aux effets d'astigmatisme 
        focaleHEL=CS(H_ETUDIE,4);
        Ht=(Hhel*Lhel)^0.5*abs(Distance_Hel_Rec(H_ETUDIE)/focaleHEL-cosd(Angle_Solaire(H_ETUDIE)));
        Wt=(Hhel*Lhel)^0.5*abs(Distance_Hel_Rec(H_ETUDIE)/focaleHEL*cosd(Angle_Solaire(H_ETUDIE))-1);
        SIGast=(0.5*(Ht^2+Wt^2))^0.5/(4*Distance_Hel_Rec(H_ETUDIE));

        %distribution de l'erreur liée aux défauts micros et macros de réflexions.
        SIGbq=((2*SIGm)^2)^0.5;

        %distribution de l'erreur liée aux défauts de tracking
        SIGt=2*(SIGel*SIGaz)^0.5;

        % distribution de l'erreur globale 
        SIGtot(H_ETUDIE)=(Distance_Hel_Rec(H_ETUDIE)^2*((SIGsun)^2+(SIGbq)^2+(SIGast)^2+(SIGt)^2))^0.5/((cosd(Angle_Recepteur(H_ETUDIE)))^0.5);

        %% Carte de flux de l'héliostat en W/m²
        FluxHel=distribution_hfcal(Resolution,Largeur_Recepteur,Hauteur_Recepteur,Pvis,SIGtot(H_ETUDIE));
        FluxHel=FluxHel*Puisance(H_ETUDIE); 
        Helio(:,:,H_ETUDIE)=FluxHel(:,:);
    end

end
