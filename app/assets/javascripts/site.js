$( document ).ready(function() {
  $video = $('.video-thumbnail');
  videojs("video_frame", {"controls": true, "autoplay": false, "preload": "auto" }, function() {
    
    // Store the video object
    var videoPlayer = this, id = videoPlayer.id();

    //Grab source from first video
    var videoSrcMp4 = $video.first().attr('data-src-mp4');
    var videoSrcWebm = $video.first().attr('data-src-webm');

    videoPlayer.src([
      { type: "video/mp4", src: videoSrcMp4 },
      { type: "video/webm", src: videoSrcWebm }
    ]);

    // Make up an aspect ratio
    var aspectRatio = 300/400; 

    function resizeVideoJS(){
      var width = document.getElementById(id).parentElement.offsetWidth;
      videoPlayer.width(width).height( width * aspectRatio );

    }
    
    // Initialize resizeVideoJS()
    resizeVideoJS();
    // Then on resize call resizeVideoJS()
    window.onresize = resizeVideoJS; 

  });
});