import "phoenix_html"

$(document).on('input', '[role~="input"]', function () {
  var $this = $(this)
  var $out = $('[role~="output"]')
  var $err = $('[role~="error"]')
  var val = $this.val()

  compile(val).then(function (res) {
    $err.html('')
    if (res.output) {
      $out.val(res.output)
    } else if (res.error) {
      $err.html(res.error)
    }
  })
  .catch(function (err) {
    $err.html('<strong>Error:</strong> <span>' + err.message + '</span>')
  })
})

$(function () {
  $('[role~="input"]').trigger('input')
})

function compile (source) {
  var options = {
    method: 'post',
    body: JSON.stringify({ input: source }),
    headers: {
      'Content-Type': 'application/json'
    }
  }

  return window.fetch('/try/compile', options)
  .then(checkStatus)
  .then(function (res) { return res.json() })
}

function checkStatus (res) {
  if (res.status >= 200 && res.status < 300) {
    return res
  }

  var err = new Error(res.statusText)
  err.response = res
  throw err
}
