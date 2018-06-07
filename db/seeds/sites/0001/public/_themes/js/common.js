$(function(){
// nocssread
  $('a[href^=#main]').on('click',function(e){
    e.preventDefault();
    var href= $(this).attr("href");
    var target = $(href == "#" || href == "" ? 'html' : href);
    var position = target.offset().top;
    $('body,html').animate({scrollTop:position}, 500);
  });

// accessibility
  Navigation.initialize({
    theme: {'#themeBlack' : 'black', '#themeBlue': 'blue', '#themeWhite' : 'white'},
    fontSize: {'#fontSmall' : '80%', '#fontMiddle': '100%', '#fontLarge' : '120%'},
    notice: '#headerBody',
    ruby: '#navigationRuby',
    talk: '#navigationTalk',
    player: '#navigationTalkPlayer'
  });
  $('a.rubyOn').text('ふりがなをはずす');
  $('#navigationTalk').on('click',function(e){
    e.preventDefault();
    if($(this).hasClass("active")){
      $(this).text('よみあげる');
    } else {
      $(this).text('よみあげ中');
    }
    $(this).toggleClass('active');
  });

// External Icon
  $("a[href^='http']").not("[href*='"+location.host+"']").append("<img src='/_themes/images/ic-blank.gif' alt='新しいウィンドウで外部サイトを開きます' class='external' />").attr("target","_blank");
  $("a img + img.external").remove();

// slick.js
  $('#keyvisual .bannerImages').slick({
    accessibility: true,  // アクセシビリティ。左右ボタンで画像の切り替えをできるかどうか
    autoplay: true,  // 自動再生。trueで自動再生される。
    autoplaySpeed: 4000,  // 自動再生で切り替えをする時間
    speed: 1000,  // 自動再生や左右の矢印でスライドするスピード
    pauseOnHover: true,  // 自動再生時にスライドのエリアにマウスオンで一時停止するかどうか
    pauseOnDotsHover: true,  // 自動再生時にドットにマウスオンで一時停止するかどうか
    cssEase: 'ease',  // 切り替えのアニメーション。ease,linear,ease-in,ease-out,ease-in-out
    dots: true,  // 画像下のドット（ページ送り）を表示
    dotsClass: 'dot-class',  // ドットのclass名をつける
    draggable: true,  // ドラッグができるかどうか
    fade: true,  // 切り替え時のフェードイン設定。trueでon
    arrows: false,  // 左右の次へ、前へボタンを表示するかどうか
    infinite: true,  // 無限スクロールにするかどうか。最後の画像の次は最初の画像が表示される。
    initialSlide: 0,  // 最初のスライダーの位置
    pauseOnHover: true,  // スライドのエリアにマウスオーバーしている間、自動再生を止めるかどうか。
    slidesToShow: 1,  // スライドのエリアに画像がいくつ表示されるかを指定
    slidesToScroll: 1,  // 一度にスライドする数
    swipe: true  // タッチスワイプに対応するかどうか
  });
  $('#keyvisual .bannerImages').slick('slickPause');
  $('#keyvisual .bannerImages').slick('slickPlay');
  $('#startBtn').addClass("current");
  $('#stopBtn').on('click',function(){
    $('#keyvisual .bannerImages').slick('slickPause');
    $('#startBtn').removeClass("current");
    $('#stopBtn').addClass("current");
  });
  $('#startBtn').on('click',function(){
    $('#keyvisual .bannerImages').slick('slickPlay');
    $('#startBtn').addClass("current");
    $('#stopBtn').removeClass("current");
  });

// pageTop
  var pagetop = $('#pageTop');
  $(window).on('scroll',function(){
    var pagetop = $('#pageTop');
    if($(this).scrollTop() > 100){
      pagetop.fadeIn();
    } else {
      pagetop.fadeOut();
    }
  });
  pagetop.on('click',function(e){
    e.preventDefault();
    $('body,html').animate({scrollTop: 0}, 500);
  });

});

// todaysEvent
$(function(){
  var simple_tabs = $('#simple_tabs > li');
  var simple_tab_panels = $('#simple_tab_panels > div');
  var index;
  simple_tabs.on('click',function(){
    if (index != simple_tabs.index(this)){
      index = simple_tabs.index(this);
      simple_tab_panels.hide().eq(index).show();
      simple_tabs.removeClass('current').eq(index).addClass('current');
    }
  });
  $(simple_tabs[0]).trigger('click');
});
