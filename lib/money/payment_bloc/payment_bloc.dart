import 'package:bloc/bloc.dart';
import 'package:camp_app/core/services/user_service.dart';
import 'package:camp_app/money/services/payment_service.dart';
import 'package:camp_app/money/services/qr_code_parser.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:meta/meta.dart';

part 'payment_event.dart';

part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PaymentService paymentService;
  final UserService userService;

  late PaymentArgument paymentArgument;

  DatabaseReference childOperationEventsRef =
      FirebaseDatabase.instance.ref("/childOperationEvents");

  PaymentBloc(this.paymentService, this.userService) : super(PaymentInitial()) {
    on<PaymentInProgress>((event, emit) async {
      try {
        emit(PaymentLoading());

        final code = event.code;
        paymentArgument = QRCodeParser.parse(code);

        emit(PaymentAreYouSure(paymentArgument.sum));
      } catch (e) {
        emit(PaymentFailure('Неверный формат QR-кода!'));
      }
    });

    on<PaymentConfirmed>((event, emit) async {
      try {
        emit(PaymentLoading());

        await paymentService.pay(
          sellerId: paymentArgument.sellerId,
          sum: paymentArgument.sum,
        );

        await childOperationEventsRef
            .child(DateTime.now().microsecondsSinceEpoch.toString())
            .set({"childId": userService.user!.id});

        emit(PaymentDone());
      } on PaymentException catch (e) {
        emit(PaymentFailure(e.msg));
      }
    });

    on<PaymentNotConfirmed>((event, emit) {
      emit(PaymentCancellation());
    });
  }
}
