﻿$(document).ready(function(){
    var playlist = [{
        title: "归云梦",
        artist: "PAL4",
        mp3: "../music/PalMusic/仙4_归云梦.mp3",
        poster: "covers/34fa4336acaf2eddb03b658a8f1001e93b0193f9.jpg"
    }, {
        title: "蝶恋",
        artist: "PAL1",
        mp3: "../music/PalMusic/仙1_蝶恋.mp3",
        poster: "covers/1946c1ea15ce36d350693f5538f33a87e850b15d.jpg"
    },{
      title:"水龙吟",
      artist:"PAL2",
      mp3:"../music/PalMusic/仙2_余情幽梦《水龙吟》.mp3",
      poster: "covers/015a8a26cffc1e17401d55544890f603728de92d.jpg"
  }, {
      title: "少年行",
      artist: "PAL3",
      mp3: "../music/PalMusic/仙3_少年行.mp3",
      poster: "covers/a43e73899e510fb3426e0cf2db33c895d0430c56.jpg"
  },{
      title: "望海潮",
      artist: "PAL3",
      mp3: "../music/PalMusic/仙3_望海潮.mp3",
      poster: "covers/b12dbc8f8c5494ee4125a27a2ff5e0fe98257e45.jpg"
  }, {
      title: "御剑江湖",
      artist: "PAL3",
      mp3: "../music/PalMusic/仙3_御剑江湖.mp3",
      poster: "covers/a20d9125bc315c60a6ebe08a8fb1cb1348547748.jpg"
  },  {
      title: "织梦行云",
      artist: "PAL4",
      mp3: "../music/PalMusic/仙4_织梦行云.mp3",
      poster: "covers/c2f911d8bc3eb135a7f84ddfa41ea8d3fc1f448e.jpg"
  }, {
      title: "眉妩",
      artist: "PAL5",
      mp3: "../music/PalMusic/仙5_眉妩.mp3",
      poster: "covers/947bdc3f8794a4c26aafbd4e0cf41bd5ac6e393d.jpg"
  }, {
      title: "迷仙引",
      artist: "PAL5",
      mp3: "../music/PalMusic/仙5_迷仙引.mp3",
      poster: "covers/810ef4039245d688c08ee8c1a6c27d1ed31b243d.jpg"
  }, {
      title: "命起涟漪",
      artist: "PAL5",
      mp3: "../music/PalMusic/仙5_命起涟漪.mp3",
      poster: "covers/f0084b166d224f4a6466ec710bf790529a22d1cc.jpg"
  }, {
      title: "少年游",
      artist: "PAL5",
      mp3: "../music/PalMusic/仙5_少年游.mp3",
      poster: "covers/bef09a45d688d43f9225cb977f1ed21b0ff43b3d.jpg"
  }, {
      title: "一夕流芳",
      artist: "PAL5",
      mp3: "../music/PalMusic/仙5_一夕流芳.mp3",
      poster: "covers/d0b6de88d43f8794b273124bd01b0ef41ad53a3d.jpg"
  }];
  
  var cssSelector = {
    jPlayer: "#jquery_jplayer",
    cssSelectorAncestor: ".music-player"
  };
  
  var options = {
    swfPath: "Jplayer.swf",
    supplied: "ogv, m4v, oga, mp3"
  };
  
  var myPlaylist = new jPlayerPlaylist(cssSelector, playlist, options);
  
});