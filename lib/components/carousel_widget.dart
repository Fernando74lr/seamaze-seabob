import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'carousel_model.dart';
export 'carousel_model.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({
    Key? key,
    required this.imagesPath,
  }) : super(key: key);

  final List<String>? imagesPath;

  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  late CarouselModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarouselModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) {
        final images = widget.imagesPath!.toList().take(10).toList();
        return Container(
          width: double.infinity,
          height: 400.0,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                child: PageView.builder(
                  controller: _model.pageViewController ??=
                      PageController(initialPage: min(0, images.length - 1)),
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, imagesIndex) {
                    final imagesItem = images[imagesIndex];
                    return Hero(
                      tag: valueOrDefault<String>(
                        '${valueOrDefault<String>(
                          imagesItem,
                          'https://www.adve/nturesports.ae/wp-content/uploads/2020/08/sb3-1.jpg',
                        )}',
                        'https://www.adve/nturesports.ae/wp-content/uploads/2020/08/sb3-1.jpg' +
                            '$imagesIndex',
                      ),
                      transitionOnUserGestures: true,
                      child: CachedNetworkImage(
                        imageUrl: valueOrDefault<String>(
                          '${valueOrDefault<String>(
                            imagesItem,
                            'https://www.adve/nturesports.ae/wp-content/uploads/2020/08/sb3-1.jpg',
                          )}',
                          'https://www.adve/nturesports.ae/wp-content/uploads/2020/08/sb3-1.jpg',
                        ),
                        width: 100.0,
                        height: 400.0,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: smooth_page_indicator.SmoothPageIndicator(
                    controller: _model.pageViewController ??=
                        PageController(initialPage: min(0, images.length - 1)),
                    count: images.length,
                    axisDirection: Axis.horizontal,
                    onDotClicked: (i) async {
                      await _model.pageViewController!.animateToPage(
                        i,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    effect: smooth_page_indicator.ExpandingDotsEffect(
                      expansionFactor: 2.0,
                      spacing: 8.0,
                      radius: 16.0,
                      dotWidth: 12.0,
                      dotHeight: 12.0,
                      dotColor: FlutterFlowTheme.of(context).accent2,
                      activeDotColor: FlutterFlowTheme.of(context).primary,
                      paintStyle: PaintingStyle.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
