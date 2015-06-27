# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#$(document).ready ->
jQuery ->
  if not $("#jstree-container").length
    console.log 'empty'
    return
  $("#jstree-container").jstree
    core:
      data: $('#temp-information').data('json-tree')
      check_callback: (operation, node, parent, position, more) ->
        return false  if operation is "copy_node"
        true
      themes:
        responsive: true
        icons: false
    dnd:
      large_drop_target: true
      large_drag_target: true
    plugins: ['dnd', 'contextmenu','wholerow']

  #  console.log $('#temp_information').data('json-tree')

# For clicking and navigate
  $('#jstree-container').delegate 'a', 'click', (e) ->
    if $('#jstree-container').jstree('is_leaf', this)
      document.location.href = this
    else
      $('#jstree-container').jstree 'toggle_node', this

  $("#container").on "move_node.jstree", (e, data) ->
    console.log "The node:#{data.node.id}. new parent: #{data.parent}."
    $.ajax({
      type: "PATCH",
      url: "/categories/#{data.node.id}.json",
      data: { category: { parent_category_id: data.parent } },
      error: (response) ->
        alert "error #{response}"
    })

  $("#container").on "rename_node.jstree", (e, data) ->
    console.log "rename_node node:#{data.node.id}. new name: #{data.text}."
    $.ajax({
      type: "PATCH",
      url: "/categories/#{data.node.id}.json",
      data: { category: { name: data.text } },
      error: (response) ->
        alert "error #{response}"
    })

  $("#container").on "create_node.jstree", (e, data) ->
    console.log "create_node node:#{data.node.id}. name: #{data.node.text}."
    $.ajax({
      type: "POST",
      url: "/categories.json",
      data: { category: { name: data.node.text, parent_category_id: data.parent } },
      success:(response) ->
        instance = $('#container').jstree(true)
        instance.set_id(data.node,response.id)
      error: (response) ->
        alert "error #{response}"
    })

  $("#container").on "delete_node.jstree", (e, data) ->
    console.log "delete_node node:#{data.node.id}."
    for child in data.node.children_d
      $.ajax({
        type: "DELETE",
        url: "/categories/#{child}.json",
        error: (response) ->
          alert "error #{response}"
      })

    $.ajax({
      type: "DELETE",
      url: "/categories/#{data.node.id}.json",
      error: (response) ->
        alert "error #{response}"
    })
