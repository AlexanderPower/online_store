# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("#container").jstree
    core:
      data: $('#temp_information').data('json-tree')
      check_callback: (operation, node, parent, position, more) ->
        return false  if operation is "copy_node"
        true
    plugins: ['dnd','contextmenu']
#  console.log $('#temp_information').data('json-tree')

  $("#container").on "move_node.jstree", (e, data) ->
    console.log "The node:#{data.node.id}. new parent: #{data.parent}."
    $.ajax({
      type: "PATCH",
      url: "/categories/#{data.node.id}",
      data: { category: { parent_category_id: data.parent } },
      error:(data) ->
        alert "error #{data}"
    })
