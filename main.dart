import 'dart:io';

void main() {
  bool keepOrdering = true;

  while (keepOrdering) {
    print('=========================================================');
    print('Pizza Price: "Small: 5 USD, Medium: 7 USD, Large: 10 USD"');

    String pizzaSize = '';
    int price = 0;

    // Keep asking until the user enters a valid size
    while (price == 0) {
      print('Please enter your pizza size (small, medium, or large):');
      pizzaSize = stdin.readLineSync()!.trim().toLowerCase();

      switch (pizzaSize) {
        case 'small':
          price = 5;
          break;
        case 'medium':
          price = 7;
          break;
        case 'large':
          price = 10;
          break;
        default:
          print('Invalid size! Please try again.');
      }
    }

    // Keep asking until the user enters a valid quantity
    int quantity = 0;
    while (quantity <= 0) {
      print('How many pizzas do you want of $pizzaSize?');
      quantity = int.tryParse(stdin.readLineSync()!.trim()) ?? 0;

      if (quantity <= 0) {
        print('Invalid quantity! Please enter a number more than 0.');
      }
    }

    int total = price * quantity;
    print('Your Total Payment is: \$$total');

    print('Do you want to order again? (yes/no)');
    String answer = stdin.readLineSync()!.trim().toLowerCase();

    if (answer != 'yes') {
      keepOrdering = false;
      print('Thank you for your order!');
    }
  }
}