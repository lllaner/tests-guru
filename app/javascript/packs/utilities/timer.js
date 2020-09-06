document.addEventListener('turbolinks:load', function(){
  var control = document.querySelector('.timer');
  if(control) { startTimer(); }
});

function startTimer() {
  console.log(document.querySelector('.timer').dataset.countDown);
  var countDownDate = document.querySelector('.timer').dataset.countDown;

  var x = setInterval(function() {


    var now = new Date().getTime();


    var distance = countDownDate - now;
    console.log(`${now} ${countDownDate}  ${distance}`)

    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);


    document.querySelector(".timer").innerHTML = days + "d " + hours + "h "
    + minutes + "m " + seconds + "s ";


    if (distance < 0) {
      document.querySelector('form').submit();
    }
  }, 1000);

}
