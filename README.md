# Exercice Ruby CT-Square

## Installation et Utilisation

 1. Récupérer les fichiers de l'application  
 `$ git clone https://github.com/theoliberman/orderapp.git`
 2. Créer la base de données  
 `$ docker-compose run ruby rake db:create db:migrate`
 3. Lancer l'application  
 `$ docker-compose up`
 4. Rendez vous sur l'interface GraphIQL  
 [`http://localhost:3000/graphiql`](http://localhost:3000/graphiql)
 5. Exécuter les requêtes    
    - Lister les transactions
       ```graphql
      {
         orders {
           order_id
           date
           client {
             client_code
           }
           order_items {
             item {
               item_code
             }
             amount
           }
         }
      }
     - Récupérer les détails d'une transaction
       ```graphql
       {
         order(orderId: 1) {
           order_id
           date
           client {
             client_code
           }
           order_items {
             item {
               item_code
             }
             amount
           }
         }
       }
    - Récupérer l'historique des transactions d'un client
      ```graphql
      {
        client(clientCode: 1234) {
          orders {
            order_id
            date
            client {
              client_code
            }
            order_items {
              item {
                item_code
              }
              amount
            }
          }
        }
      }
    - Récupérer toutes les commandes qui concernent un produit donné
      ```graphql
      {
        item(itemCode: 789456) {
          orders {
            order_id
            date
            client {
              client_code
            }
            order_items {
              item {
                item_code
              }
              amount
            }
          }
        }
      }
    - Récupérer les commandes passées entre deux dates  
      ```graphql
      {
        ordersBetween(start: "2019-04-01", finish: "2019-05-01") {
          order_id
          date
          client {
            client_code
          }
          order_items {
            item {
              item_code
            }
            amount
          }
        }
      }
 6. Produire une nouvelle transaction à partir d'un fichier (JSON, XML, YML)  
 `$ docker-compose run ruby ruby producer.rb transactions/transaction.json`


## Introduction

L’objectif de l’exercice est de réaliser un petit projet qui devra :

 - Recevoir des ordres d'achat depuis un *topic* kafka
 - Les stocker dans une base de données
 - Permettre de requêter la base via une interface GraphQL

Si un ordre d’achat reçu est invalide, il est effacé, mais une erreur doit être affichée.

Les objectifs principaux de l’interface GraphQL sont :

 - Lister les transactions
 - Récupérer les détails d'une transaction
 - Récupérer l'historique des transactions d'un client
 - Récupérer toutes les commandes qui concernent un produit donné

## Les ordres d'achat

Il y a trois formats de message: JSON, YAML et XML. Dans les trois cas, les messages correspondent à des ordres d’achat. Un ordre d’achat contient un ID de transaction, une date (toujours au format ISO8601), un code client, et une liste d’objets commandés (référence et nombre).

### Format JSON

    {
      "transaction_id": 1,
      "date": "2019-06-12T11:46:08+02:00",
      "client_id": 1234,
      "items": [
        [789456, 3],
        [456123, 1]
      ]
    }


### Format YAML

    transaction:
      id: 1
      date: "2019-06-12T11:46:08+02:00"
      client:
      id: 1234
      items:
      - sku: "789456"
        amount: 3
      - sku: "456132"
        amount: 1
        
### Format XML

    <?xml version="1.0" encoding="UTF-8"?>
    <order>
      <transactionid>1</transactionid>
      <date>2019-06-12T11:46:08+02:00</date>
      <buyer>
        <clientcode>1234</clientcode>
      </buyer>
      <items>
        <item>
          <itemcode>789456</itemcode>
          <itemcount>3</itemcount>
        </item>
        <item>
          <itemcode>456123</itemcode>
          <itemcount>1</itemcount>
        </item>
      </items>
    </order>