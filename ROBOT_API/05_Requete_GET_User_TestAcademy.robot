*** Settings ***
Library     RequestsLibrary    # Import de la bibliothèque pour les requêtes HTTP
Library     JSONLibrary    # Import de la bibliothèque pour la manipulation JSON
Library     Collections    # Import de la bibliothèque pour la manipulation de collections
*** Variables ***
${Base_URL}     https://mock-api-h0g7.onrender.com/    # Définition de l'URL de base de l'API
${API_KEY}      Cle-API-ReqRes-test-academy    # Clé API pour l'authentification
${Id_Utilisateur}    13
*** Test Cases ***
Test Requete GET User
    &{headers}=    Create Dictionary    Authorization=Bearer ${API_KEY}
    ${Reponse}=    GET    ${Base_URL}api/users/${Id_Utilisateur}    headers=${headers}    expected_status=200
    ${ReponseJson}=    Set Variable    ${Reponse.json()}    # Convertir la réponse JSON en dictionnaire
    Log    ${ReponseJson}
    # Vérifier que la réponse contient la clé 'data'
    Dictionary Should Contain Key    ${ReponseJson}    data
    # Extraire les données de l'utilisateur
    ${Utilisateur}=    Get From Dictionary    ${ReponseJson}    data
    # Vérifier que l'utilisateur a un ID
    Dictionary Should Contain Key    ${Utilisateur}    id
    ${id}=    Get From Dictionary    ${Utilisateur}    id
    Should Be Equal As Integers    ${id}    ${Id_Utilisateur}
    # Vérifier que l'utilisateur a un email
    Dictionary Should Contain Key    ${Utilisateur}    email
    # Vérifier que l'utilisateur a un prénom
    Dictionary Should Contain Key    ${Utilisateur}    first_name
    # Vérifier que l'utilisateur a un nom
    Dictionary Should Contain Key    ${Utilisateur}    last_name
