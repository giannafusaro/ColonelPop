# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# $(document).ready ->
#
#   if $('table').length
#     $.ajax
#       url: $('table').data('source')
#       beforeSend: ->
#         $('#status').text('Loading...')
#       success: (data) ->
#         $('#status').text('')
#         for movie in data.results
#           $('table tbody').append """
#             <tr>
#               <td><img src="#{movie.poster_120x171}" /></td>
#               <td><a href="/movie/#{movie.id}/reviews">#{movie.title}</a></td>
#               <td>#{movie.rating}</td>
#               <td>#{movie.release_year}</td>
#             </tr>
#           """
