Description: Hometask API test

Scenario: Verify there is a ship named Star Destroyer
When I execute HTTP GET request for resource with URL `https://swapi.dev/api/starships/3/`
Then `${responseCode}` is equal to `200`
Then JSON element value from context by JSON path `$.name` is equal to `Star Destroyer`

Scenario: Verify that POST method is not allowed
Given request body: {
"name": "Star Complainer",
"model": "Worst Ship Ever"
}
When I execute HTTP POST request for resource with URL `https://swapi.dev/api/starships/3/`
Then `${responseCode}` is equal to `405`
Then JSON element value from context by JSON path `$.detail` is equal to `Method 'POST' not allowed.`