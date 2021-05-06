/**
 * 相机对象
 * 西瓜刀
 * 2020年5月20日10:42:04
 */
var Camera = function (videoId) {
    let _this = this;
    let video = document.querySelector(videoId);
    navigator.getUserMedia = navigator.getUserMedia ||
        navigator.webkitGetUserMedia ||
        navigator.mozGetUserMedia;
    //启动
    this.openPlay = function () {
        if (navigator.getUserMedia) {
            navigator.getUserMedia({audio: false, video: {width: 1280, height: 720}},
                function (stream) {
                    _this.MediaStreamTrack = typeof stream.stop === 'function' ? stream : stream.getTracks()[0];
                    video.srcObject = stream;
                    video.play();
                },
                function (err) {
                    console.log("The following error occurred: " + err.name);
                }
            );
        } else {
            console.log("getUserMedia not supported");
        }
    };
    //关闭
    this.closePlay = function () {
        this.MediaStreamTrack && this.MediaStreamTrack.stop();
    };
    //拍照
    this.takePhoto = function () {
        //获得Canvas对象
        let canvas = document.createElement("canvas");
        let ctx = canvas.getContext('2d');
        ctx.drawImage(video, 0, 0,300,160);
        let base64URL = canvas.toDataURL('image/jpeg', 1);
        return base64URL;
    }
}


