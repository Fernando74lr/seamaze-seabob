import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'carousel_copy_model.dart';
export 'carousel_copy_model.dart';

class CarouselCopyWidget extends StatefulWidget {
  const CarouselCopyWidget({
    Key? key,
    required this.imagesPath,
  }) : super(key: key);

  final List<String>? imagesPath;

  @override
  _CarouselCopyWidgetState createState() => _CarouselCopyWidgetState();
}

class _CarouselCopyWidgetState extends State<CarouselCopyWidget> {
  late CarouselCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarouselCopyModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 500.0,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
            child: PageView(
              controller: _model.pageViewController ??=
                  PageController(initialPage: 0),
              scrollDirection: Axis.horizontal,
              children: [
                Image.network(
                  valueOrDefault<String>(
                    widget.imagesPath?.first,
                    'https://www.adventuresports.ae/wp-content/uploads/2020/08/sb3-1.jpg',
                  ),
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
                Image.network(
                  valueOrDefault<String>(
                    widget.imagesPath?[1],
                    'https://www.adventuresports.ae/wp-content/uploads/2020/08/sb3-1.jpg',
                  ),
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
                Image.network(
                  valueOrDefault<String>(
                    widget.imagesPath?.last,
                    'https://www.adventuresports.ae/wp-content/uploads/2020/08/sb3-1.jpg',
                  ),
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
              child: smooth_page_indicator.SmoothPageIndicator(
                controller: _model.pageViewController ??=
                    PageController(initialPage: 0),
                count: 3,
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
                  dotWidth: 16.0,
                  dotHeight: 16.0,
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
  }
}
