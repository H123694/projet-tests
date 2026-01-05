*** Settings ***
Library     RequestsLibrary    # Import de la bibliothèque pour les requêtes HTTP
Library     JSONLibrary    # Import de la bibliothèque pour la manipulation JSON
Library     Collections    # Import de la bibliothèque pour la manipulation de collections
*** Variables ***
${Base_URL}     https://mock-api-h0g7.onrender.com/    # Définition de l'URL de base de l'API
${API_KEY}      Cle-API-ReqRes-test-academy    # Clé API pour l'authentification
${Id_Ressource}    2
*** Test Cases ***
Test Requete GET Resource
    &{headers}=    Create Dictionary    Authorization=Bearer ${API_KEY}
    ${Reponse}=    GET    ${Base_URL}api/unknown/${Id_Ressource}    headers=${headers}    expected_status=200
    ${ReponseJson}=    Set Variable    ${Reponse.json()}    # Convertir la réponse JSON en dictionnaire
    Log    ${ReponseJson}
    # Vérifier que la réponse contient la clé 'data'
    Dictionary Should Contain Key    ${ReponseJson}    data
    # Extraire les données de la ressource
    ${Ressource}=    Get From Dictionary    ${ReponseJson}    data
    # Vérifier que la ressource a un ID
    Dictionary Should Contain Key    ${Ressource}    id
    ${id}=    Get From Dictionary    ${Ressource}    id
    Should Be Equal As Integers    ${id}    ${Id_Ressource}
    # Vérifier que la ressource a un nom
    Dictionary Should Contain Key    ${Ressource}    name
    # Vérifier que la ressource a une année
    Dictionary Should Contain Key    ${Ressource}    year
    # Vérifier que la ressource a une couleur
    Dictionary Should Contain Key    ${Ressource}    color
    # Vérifier que la ressource a une valeur pantone
    Dictionary Should Contain Key    ${Ressource}    pantone_value
