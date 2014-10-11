// Declaring variables
var currentVideo;
var nextVideo;
var prevVideo;
var player;
var currentID;

// Seting up video player and status
$('document').ready(function(){

  getStatus();

  videojs("video").on("ended", function() {
    onFinish();
  });

  $('#video-next').click(function(){
    goToVideo(nextVideo);
  });
  $('#video-prev').click(function(){
    goToVideo(prevVideo);
  });
});

// Get functions
function getCurrentID(){
  player = $('#video-player');
  console.log("firing get current")
  console.log(player);
  currentID = player.attr('data-video-id');
  console.log("current ID: " + currentID);
  return currentID
}
function getCurrent() {
  var _self = $('.grid').find('[data-video-thumb-id="' + currentID + '"]');
  return _self
}
function getNext(currentVideo) {
  var _next = currentVideo.next();
  return _next
}
function getPrev(currentVideo) {
  var _prev = currentVideo.prev();
  return _prev
}
function getStatus() {
  getCurrentID();
  currentVideo = getCurrent();
  nextVideo = getNext(currentVideo);
  prevVideo = getPrev(currentVideo);


  console.log("Current Video: " + currentVideo.attr('href'));
  console.log("Next Video: " + nextVideo.attr('href'));
  console.log("Prev Video: " + prevVideo.attr('href'));
}
function onFinish(){
  goToVideo(nextVideo);
}
function goToNextVideo(){
  var nextVideoURL = nextVideo.attr('href');
  $.get(nextVideoURL)
  .done(function( data ) {
    getStatus();
  });
}
function goToPrevVideo(){
  var prevVideoURL = prevVideo.attr('href');
  $.get(prevVideoURL)
  .done(function( data ) {
    getStatus();
  });
}
function goToVideo(video){
  var videoURL = video.attr('href');
  $.get(videoURL)
    .done(function( data ) {
      getStatus();
  });
}