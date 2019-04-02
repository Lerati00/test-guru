document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.progress-bar')
  if (control) {
    progressBarHandler()
  }
})

function progressBarHandler() {
  var progressPercent = document.querySelector('.progress-bar').dataset.progressPercent
  document.querySelector('.progress-bar').style.width = progressPercent + "%"
}