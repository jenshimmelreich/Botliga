rest = require 'restler'

token = 'myofpya1ideenwr1xq9n1m2l'

rest.get('http://botliga.de/api/matches/2011').on 'complete', (data, response) ->
  for match in data
    tip =
      match_id: match.id
      result: '2:1'
      token: token
    # console.log tip
    response = rest.post 'http://botliga.de/api/guess', {data: tip}
    response.on 'complete', (data, response) ->
      console.log response.statusCode
    response.on 'error', (error) ->
      console.log error
