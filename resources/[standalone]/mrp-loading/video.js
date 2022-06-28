function onYouTubeIframeAPIReady() {
  var player;
  player = new YT.Player('YouTubeBackgroundVideoPlayer', {
      videoId: '5P7i9jV9jew', // YouTube Video ID
      width: 1920,               // Player width (in px)
      height: 1080,              // Player height (in px)
      playerVars: {
        //playlist: '5P7i9jV9jew','8OA_C7sHtt4','YXRq6R4c5gk','cCEcC7yPO60','dcwddcYq-3o','WdLUOgiDwW4',
			playlist: '5P7i9jV9jew',
          autoplay: 1,        // Auto-play the video on load
          autohide: 1,
          disablekb: 1, 
          controls: 0,        // Hide pause/play buttons in player
          showinfo: 0,        // Hide the video title
          modestbranding: 1,  // Hide the Youtube Logo
          loop: 1,            // Run the video in a loop
          fs: 0,              // Hide the full screen button
          autohide: 0,         // Hide video controls when playing
          rel: 0,
          enablejsapi: 1
      },
      events: {
        onReady: function(e) {
            e.target.mute();
            e.target.setPlaybackQuality('hd1080');
        },
        onStateChange: function(e) {
          if(e && e.data === 1){
              var videoHolder = document.getElementById('home-banner-box');
              if(videoHolder && videoHolder.id){
                videoHolder.classList.remove('loading');				
              }
			  
			  var x = document.getElementById("myAudio");
				x.play();
				x.volume = 0.12;
          }else if(e && e.data === 0){
            e.target.playVideo()
          }
        }
      }
  });
}
//8OA_C7sHtt4 - Bugatti
//YXRq6R4c5gk - Cars
//WdLUOgiDwW4 - Roleplay Tennis
//https://www.youtube.com/watch?v=yyi4IBg31g8&list=PLHEzhLjNPfucBgKll9lCzNhITHQgMqCuY