document.addEventListener('turbolinks:load', function() {
  control = document.querySelector('.timer .time')

  if (control){
    time = 30 * 60 + 1
    timer(control)
  }
})

function timer(){
  time--
  var startTimer = Number(control.dataset.startTimer) 
  var timer = control.dataset.timer * 60 
  var endTimer = startTimer + timer
  var currentTime = Math.floor(Date.now() / 1000)
  var restTime = (endTimer - currentTime)
  setInterval(function(){
    restTime--
    if (restTime <= 0){
      location.replace(location.href + "/result")
    }
    min = Math.floor(restTime/60)
    sec = restTime % 60
    document.querySelector('.timer .time').textContent = min + ':' + sec
  },1000)

}

  

