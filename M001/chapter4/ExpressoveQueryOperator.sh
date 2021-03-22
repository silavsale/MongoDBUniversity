# Switch to this database:
use sample_training
 
# Find all documents where the trip started and ended at the same station:
db.trips.find({ "$expr": { "$eq": [ "$end station id", "$start station id"] }
              }).count()
 
# Find all documents where the trip lasted longer than 1200 seconds, and started and ended at the same station:
db.trips.find({ "$expr": { "$and": [ { "$gt": [ "$tripduration", 1200 ]},
                         { "$eq": [ "$end station id", "$start station id" ]}
                       ]}}).count()