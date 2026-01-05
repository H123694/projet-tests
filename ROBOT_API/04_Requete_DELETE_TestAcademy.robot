*** Settings ***
Library     RequestsLibrary    # Import de la bibliothèque pour les requêtes HTTP
Library     Collections    # Import de la bibliothèque pour la manipulation de collections

*** Variables ***
${Base_URL}             https://mock-api-h0g7.onrender.com/    # Définition de l'URL de base de l'API
${API_KEY}              Cle-API-ReqRes-test-academy    # Clé API pour l'authentification

*** Test Cases ***
Test Requete DELETE
    &{headers}=    Create Dictionary    Authorization=Bearer ${API_KEY}
    
    # Création d'un utilisateur temporaire à supprimer
    &{Corps_Requete}=    Create Dictionary    first_name=Temp    last_name=User    email=temp.user@test.com
    ${Reponse_POST}=    POST    ${Base_URL}api/users    json=${Corps_Requete}    headers=${headers}    expected_status=201
    ${id_to_delete}=    Get From Dictionary    ${Reponse_POST.json()}    id

    # Suppression de l'utilisateur créé
    ${Reponse}=    DELETE    ${Base_URL}api/users/${id_to_delete}    headers=${headers}    expected_status=204
