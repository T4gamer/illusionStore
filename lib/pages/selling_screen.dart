import 'package:flutter/material.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Color(0xFF212425),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(onPressed: () {

                    }, child: Icon(Icons.chair_rounded)),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(450, 0, 0, 0),
                      child: Text("طرق الدفع",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                PaymentOptions(),
                const Padding(
                  padding: EdgeInsets.fromLTRB(580, 0, 0, 0),
                  child: Text("عناصر الوصول السريع",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold)),
                ),
                const FastAccessButtons(),
                const Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 544,
                        height: 72,
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.qr_code_2,color: Colors.white,size: 32),
                            fillColor: Color(0xff3C3F41),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32)),
                              borderSide: BorderSide(color:Color(0xFF212425)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32)),
                              borderSide: BorderSide(color: Color(0xFF212425)),
                            ),
                          ),
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          "باركود",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Spacer(),
            const Cart()
          ],
        ));
  }
}

class PaymentOptions extends StatelessWidget {
  const PaymentOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        PaymentButton(
            buttonText: "البطاقة المصرفية", asset_name: "card_icon.png"),
        PaymentButton(buttonText: "نقدا", asset_name: "money_icon.png"),
        PaymentButton(buttonText: "سداد", asset_name: "sadad_icon.png"),
      ],
    );
  }
}

class FastAccessButtons extends StatelessWidget {
  const FastAccessButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            FastAccessButton(buttonText: "عصير"),
            FastAccessButton(buttonText: "عصير"),
            FastAccessButton(buttonText: "عصير"),
          ],
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 17)),
        Row(
          children: [
            FastAccessButton(buttonText: "عصير"),
            FastAccessButton(buttonText: "عصير"),
            FastAccessButton(buttonText: "عصير"),
          ],
        ),
      ],
    );
  }
}

class PaymentButton extends StatelessWidget {
  final String buttonText;
  final String asset_name;

  const PaymentButton(
      {super.key, required this.buttonText, required this.asset_name});

  @override
  Widget build(BuildContext context) {
    const Color color = Color(0xff3C3F41);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: 256,
        height: 256,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(color),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
            ),
            onPressed: () {},
            child: Column(
              children: [
                Spacer(),
                Image.asset('asset/$asset_name'),
                Text(
                  buttonText,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
              ],
            )),
      ),
    );
  }
}

class FastAccessButton extends StatelessWidget {
  final String buttonText;

  const FastAccessButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    const Color color = Color(0xff3C3F41);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: 256,
        height: 128,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(color),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
            ),
            onPressed: () {},
            child: Column(
              children: [
                Image.asset('asset/package.png'),
                Text(
                  buttonText,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )),
      ),
    );
  }
}

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  var items = [1];

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xff3C3F41),
          image: DecorationImage(
            image: AssetImage('asset/cart.png'),
          ),
        ),
        child: Column(
          children: [
            Text("سلة المشتريات",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(
                height: 546,
                width: 414,
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CartItem();
                  },
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("الاجمالي",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight.bold)),
                  Padding(padding: EdgeInsets.only(left: 24))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: SizedBox(
                width: 384,
                height: 68,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xffFAF950)),
                    ),
                    child: const Text("دفع",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 44,
                            fontWeight: FontWeight.bold))),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          bottom: 6,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 64),
          child: Container(
            // width: 400,
            // height: 64,
            decoration: BoxDecoration(
                color: const Color(0xff222526),
                border: Border.all(
                  color: const Color(0xff222526),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(32))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xffF24E1E)),
                      shape: MaterialStateProperty.all<CircleBorder>(
                          const CircleBorder()),
                    ),
                    child: const Icon(
                      Icons.cancel_outlined,
                      color: Colors.white,
                    )),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                const Expanded(
                  child: Text("5",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                const Text("زيت الصفوة",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
                const Padding(padding: EdgeInsets.only(left: 24))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
