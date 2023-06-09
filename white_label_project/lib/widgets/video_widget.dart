// ignore_for_file: unnecessary_null_comparison

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../constant/constant.dart';

// ignore: must_be_immutable
class VideoWidget extends StatefulWidget {
  final String url;
  final String previewImgUrl;
  final bool showProgressBar;
  final bool showProgressText;

  VideoWidget(this.url,
      {Key? key,
      required this.previewImgUrl,
      this.showProgressBar = true,
      this.showProgressText = true})
      : super(key: key);

  // ignore: library_private_types_in_public_api
  late _VideoWidgetState state;

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    state = _VideoWidgetState();
    return state;
  }

  updateUrl(String url) {
    state.setUrl(url);
  }
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;
  late VoidCallback listener;
  bool _showSeekBar = true;

  _VideoWidgetState() {
    listener = () {
      if (mounted) {
        setState(() {});
      }
    };
  }

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        if (mounted) {
          setState(() {});

          if (_controller.value.duration == _controller.value.position) {
            _controller.seekTo(const Duration(seconds: 0));
            setState(() {});
          }
        }
      });
    _controller.addListener(listener);
  }

  @override
  void deactivate() {
    _controller.removeListener(listener);
    super.deactivate();
  }

  late FadeAnimation imageFadeAnim;

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[
      GestureDetector(
        child: VideoPlayer(_controller),
        onTap: () {
          setState(() {
            _showSeekBar = !_showSeekBar;
          });
        },
      ),
      getPlayController(),
    ];

    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: Stack(
        fit: StackFit.passthrough,
        children: children,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  CachedNetworkImage? getPreviewImg() {
    return widget.previewImgUrl.isNotEmpty
        ? CachedNetworkImage(imageUrl: widget.previewImgUrl)
        : null;
  }

  getMinuteSeconds(var inSeconds) {
    if (inSeconds == null || inSeconds <= 0) {
      return '00:00';
    }
    var tmp = inSeconds ~/ Duration.secondsPerMinute;
    var minute = '';
    if (tmp < 10) {
      minute = '0$tmp';
    } else {
      minute = '$tmp';
    }

    var tmp1 = inSeconds % Duration.secondsPerMinute;
    var seconds = '';
    if (tmp1 < 10) {
      seconds = '0$tmp1';
    } else {
      seconds = '$tmp1';
    }
    return '$minute:$seconds';
  }

  getDurationText() {
    var txt = '';
    if (_controller.value.duration == null) {
      txt = '00:00/00:00';
    } else {
      txt =
          '${getMinuteSeconds(_controller.value.position.inSeconds)}/${getMinuteSeconds(_controller.value.duration.inSeconds)}';
    }
    return Text(
      txt,
      style: const TextStyle(color: Colors.white, fontSize: 14.0),
    );
  }

  getPlayController() {
    return Offstage(
      offstage: !_showSeekBar,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: IconButton(
                iconSize: 55.0,
                icon: Image.asset(Constant.ASSETS_IMG +
                    (_controller.value.isPlaying
                        ? 'ic_pause.png'
                        : 'ic_playing.png')),
                onPressed: () {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    _controller.play();
                  }
                }),
          ),
          getProgressContent(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Center(
                child: _controller.value.isBuffering
                    ? const CircularProgressIndicator()
                    : null),
          )
        ],
      ),
    );
  }

  ///更新播放的URL
  void setUrl(String url) {
    if (mounted) {
      _controller.removeListener(listener);
      _controller.pause();
      _controller = VideoPlayerController.network(url)
        ..initialize().then((_) {
          //初始化完成后，更新状态
          setState(() {});
          if (_controller.value.duration == _controller.value.position) {
            _controller.seekTo(const Duration(seconds: 0));
            setState(() {});
          }
        });
      _controller.addListener(listener);
    }
  }

  Widget getProgressContent() {
    return (widget.showProgressBar || widget.showProgressText
        ? Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 13.0,
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Offstage(
                      offstage: !widget.showProgressBar,
                      child: VideoProgressIndicator(
                        _controller,
                        allowScrubbing: true,
                        colors: const VideoProgressColors(
                            playedColor: Colors.amberAccent,
                            backgroundColor: Colors.grey),
                      ),
                    ),
                  ),
                ),
                Offstage(
                  child: getDurationText(),
                  offstage: !widget.showProgressText,
                )
              ],
            ),
          )
        : Container());
  }
}

class FadeAnimation extends StatefulWidget {
  const FadeAnimation(
      {super.key,
      required this.child,
      this.duration = const Duration(milliseconds: 1500)});

  final Widget child;
  final Duration duration;

  @override
  // ignore: library_private_types_in_public_api
  _FadeAnimationState createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: widget.duration, vsync: this);
    animationController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    animationController.forward(from: 0.0);
  }

  @override
  void deactivate() {
    animationController.stop();
    super.deactivate();
  }

  @override
  void didUpdateWidget(FadeAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.child != widget.child) {
      animationController.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return animationController.isAnimating
        ? Opacity(
            opacity: 1.0 - animationController.value,
            child: widget.child,
          )
        : Container();
  }
}
