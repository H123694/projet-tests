*** Settings ***
Library    Selenium2Library    timeout=20s



*** Variables ***
${SERVEUR}    livraison3.testacademy.fr
${HOMEY URL}    http://${SERVEUR}/
${NAVIGATEUR}    edge
${LIEN SE CONNECTER}    xpath=//a[contains(text(),'Se connecter')]
${LIEN SE DECONNECTER}    xpath=(//a[contains(text(),'Se déconnecter')])[3]   
${UTILISATEUR VALIDE}    robot
${MOT DE PASSE VALIDE}    robot
${UTILISATEUR NON VALIDE}    nonvalide
${MOT DE PASSE NON VALIDE}    nonvalide
${CHAMP NOM UTILISATEUR}    name=username
${CHAMP MOT DE PASSE}    name=password
${BOUTON VALIDER}    css=.homey_login_button
${TITRE TABLEAU DE BORD}    Tableau de bord - Livraison 3
${ESPACE POUR AFFICHER LES ERREURS}    css=#modal-login .error
${BOUTON CHERCHER}    xpath=//button[@type='submit']
${LIEN LISTING}    xpath=//div[@id='homey_halfmap_listings_container']/div[4]/div/div/div/a
${BOUTON CONTACT HOTE}    css=.btn-full-width:nth-child(2)
${MODAL CONTACT}    id=modal-contact-host
${CHAMP NOM CONTACT}    name=name
${CHAMP EMAIL CONTACT}    name=email
${CHAMP PHONE CONTACT}    name=phone
${CHAMP MESSAGE CONTACT}    name=message
${BOUTON SOUMETTRE CONTACT}    css=.contact_listing_host
${BOUTON MESSAGE}    css=.homey_contact_messages
${MAIN_WINDOW}                ${EMPTY}
${LONG_MESSAGE}    Ce message fait plus de 500 caractères pour tester la limite du champ message. \Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. \Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

*** Keywords ***
Ouvrir Le Navigateur Et Accéder A La Page d'Accueil
    Open Browser    browser=${NAVIGATEUR}  
    Maximize Browser Window
    Go To     ${HOMEY URL}
    
Accéder A La Page De Connexion
    Run Keyword And Ignore Error    Click Element    ${LIEN SE CONNECTER}
   
    Wait Until Element Is Visible    ${CHAMP NOM UTILISATEUR}    20s    

Entrer Le Nom d'Utilisateur
    [Arguments]    ${nom_utilisateur}
   Click Element     ${CHAMP NOM UTILISATEUR}
   Input Text    ${CHAMP NOM UTILISATEUR}    ${nom_utilisateur}

Entrer Le Mot De Passe
    [Arguments]    ${mot_de_passe}
   Click Element     ${CHAMP MOT DE PASSE}
   Input Text    ${CHAMP MOT DE PASSE}    ${mot_de_passe}

Soumettre Le Formulaire De Connexion
   Click Button    ${BOUTON VALIDER} 

Vérifiez Que Le Tableau De Bord Est Visible
    Title Should Be    ${TITRE TABLEAU DE BORD}
    Wait Until Element Is Visible    ${LIEN SE DECONNECTER}   

Effectuer Une Déconnexion Réussie    
    Click Element    ${LIEN SE DECONNECTER}
    Wait Until Element Is Visible    ${LIEN SE CONNECTER}


Vérifier Que Le Lien De Connexion Est Visible
    Element Should Be Visible    ${LIEN SE CONNECTER}

Aller Jusqu'au Formulaire De Contact
    Wait Until Page Contains    ${HOMEY URL}  
    Click Button    ${BOUTON CHERCHER}
    Wait Until Element Is Visible    ${LIEN LISTING}   
    Click Element    ${LIEN LISTING}
    Wait Until Page Contains    Full House For Families    

    # حفظ النافذة الأساسية والانتقال إلى النافذة المنبثقة
    ${handles}    Get Window Handles
    Set Suite Variable    ${MAIN_WINDOW}    ${handles}[0]
    
    Wait Until Element Is Visible    ${BOUTON CONTACT HOTE}    timeout=20s
    Click Button    ${BOUTON CONTACT HOTE}
    Wait Until Element Is Visible    ${MODAL CONTACT}    

Remplir Les Champs Et Envoyer
    [Arguments]    ${nom}    ${email}    ${phone}    ${message}
    Clear Element Text    ${CHAMP NOM CONTACT}
    Input Text    ${CHAMP NOM CONTACT}    ${nom}
    Clear Element Text    ${CHAMP EMAIL CONTACT}
    Input Text    ${CHAMP EMAIL CONTACT}    ${email}
    Clear Element Text    ${CHAMP PHONE CONTACT}
    Input Text    ${CHAMP PHONE CONTACT}    ${phone}
    Clear Element Text    ${CHAMP MESSAGE CONTACT}
    Input Text    ${CHAMP MESSAGE CONTACT}    ${message}
    Click Button    ${BOUTON SOUMETTRE CONTACT} 
