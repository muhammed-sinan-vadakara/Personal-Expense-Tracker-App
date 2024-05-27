import 'package:objectbox/objectbox.dart';

@Entity()
class ExpenseEntityModel {
  @Id()
  int id = 0;
  String? dateandtime;
  String? tittle;
  int? amount;
  String? describtion;

  ExpenseEntityModel({
    required this.dateandtime,
    required this.tittle,
    required this.amount,
    required this.describtion,
  });
}
