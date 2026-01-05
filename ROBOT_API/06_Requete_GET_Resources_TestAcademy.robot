*** Settings ***
Library     RequestsLibrary    # Import de la bibliothèque pour les requêtes HTTP
Library     JSONLibrary    # Import de la bibliothèque pour la manipulation JSON
Library     Collections    # Import de la bibliothèque pour la manipulation de collections
*** Variables ***
${Base_URL}     https://mock-api-h0g7.onrender.com/    # Définition de l'URL de base de l'API
${API_KEY}      Cle-API-ReqRes-test-academy    # Clé API pour l'authentification
*** Test Cases ***
Test Requete GET Resources
    &{Params}=    Create Dictionary    page=1    per_page=6    # Créer un dictionnaire de paramètres pour la requête
    &{headers}=    Create Dictionary    Authorization=Bearer ${API_KEY}
    ${Reponse}=    GET    ${Base_URL}api/unknown    params=${Params}    headers=${headers}    expected_status=200
    ${ReponseJson}=    Set Variable    ${Reponse.json()}    # Convertir la réponse JSON en dictionnaire
    Log    ${ReponseJson}
    # Vérifier que la réponse contient la clé 'data'
    Dictionary Should Contain Key    ${ReponseJson}    data
    # Extraire la liste des ressources du dictionnaire JSON
    ${ListeRessources}=    Get Value From Json    ${ReponseJson}    data[:]
    # Vérifier que la liste n'est pas vide
    ${longueur}=    Get Length    ${ListeRessources}
    Should Be True    ${longueur} > 0
    # Obtenir la première ressource de la liste
    ${PremiereRessource}=    Get From List
    ...    ${ListeRessources}
    ...    0
    # Vérifier que la ressource a un ID
    Dictionary Should Contain Key    ${PremiereRessource}    id
    # Vérifier que la ressource a un nom
    Dictionary Should Contain Key    ${PremiereRessource}    name
    # Vérifier que la ressource a une couleur
    Dictionary Should Contain Key    ${PremiereRessource}    color
