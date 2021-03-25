# Connect to the Atlas cluster:
mongo "mongodb+srv://<username>:<password>@<cluster>.mongodb.net/admin"

# Switch to this database:
use sample_airbnb

# Find all documents with exactly 20 amenities which include all the amenities listed in the query array:
db.listingsAndReviews.find({ "amenities": {
                                  "$size": 20,
                                  "$all": [ "Internet", "Wifi",  "Kitchen",
                                           "Heating", "Family/kid friendly",
                                           "Washer", "Dryer", "Essentials",
                                           "Shampoo", "Hangers",
                                           "Hair dryer", "Iron",
                                           "Laptop friendly workspace" ]
                                         }
                            }).pretty()