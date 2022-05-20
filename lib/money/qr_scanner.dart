import 'dart:async';
import 'dart:io';

import 'package:camp_app/core/widgets/show_snackbar.dart';
import 'package:camp_app/money/payment_bloc/payment_bloc.dart';
import 'package:camp_app/money/widgets/payment_dialog.dart';
import 'package:camp_app/money/widgets/qr_corners.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  final scanArea = 215;
  final cornerAreaSize = 222;

  // In order to get hot reload to work we need
  //to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentBloc, PaymentState>(
      listener: (context, state) async {
        if (state is PaymentAreYouSure) {
          final bool? agree = await showDialog(
            context: context,
            builder: (_) => PaymentDialog(state.sum),
          );

          if (agree != null && agree) {
            context.read<PaymentBloc>().add(PaymentConfirmed());
          } else {
            context.read<PaymentBloc>().add(PaymentNotConfirmed());
          }
        }

        if (state is PaymentFailure) {
          showSnackBar(context: context, message: state.msg);
        }

        if (state is PaymentDone) {
          showSnackBar(context: context, message: 'всё ок!');
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(255, 255, 255, 0),
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(255, 255, 255, 0),
            leading: Padding(
              padding: const EdgeInsets.only(left: 27),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: const Color(0xffF7F9FA),
              ),
            ),
          ),
          body: LayoutBuilder(builder: (context, constraints) {
            final bodySize = constraints.maxHeight;
            final appBarSize = MediaQuery.of(context).size.height - bodySize;

            return Stack(
              children: <Widget>[
                Positioned.fill(
                  child: QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                    overlay: QrScannerOverlayShape(
                      overlayColor: Color.fromRGBO(0, 0, 0, 0.6),
                      borderColor: Colors.white,
                      borderRadius: 15,
                      borderLength: 0,
                      borderWidth: 2,
                      cutOutSize: scanArea.toDouble(),
                      cutOutBottomOffset: 50,
                    ),
                    onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: cornerAreaSize.toDouble(),
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(top: appBarSize + 60.h),
                        child: const Text(
                          'Отсканируйте QR-код для оплаты',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 100),
                    child: Corners(
                      topPadding: cornerAreaSize,
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  // horrible stuff in order to get rid of too fast barcode processing
  bool isAvailable = true;
  Timer? limitTimer;
  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    limitTimer = Timer.periodic(
      const Duration(milliseconds: 1000),
      (Timer t) {
        isAvailable = true;
      },
    );

    controller.scannedDataStream.listen(
      (scanData) {
        if (isAvailable) {
          final code = scanData.code;

          if (code != null && context.read<PaymentBloc>().state is! PaymentAreYouSure) {
            context.read<PaymentBloc>().add(PaymentInProgress(code));
          }

          isAvailable = false;
        }
      },
    );
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    // log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    limitTimer?.cancel();
    super.dispose();
  }
}
