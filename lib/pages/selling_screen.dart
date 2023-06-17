import 'package:flutter/material.dart';
import 'package:illusionpos/providers/product_list_provider.dart';
import '../models/Product.dart';
import 'package:provider/provider.dart';


class SalesPage extends StatelessWidget {
  const SalesPage({super.key});
  @override
  Widget build(BuildContext context) {
    final addProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
        backgroundColor: Color(0xFF212425),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff3C3F41)),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/receipt_list");
                      },
                      child: Image.asset(
                        "asset/receipt.png",
                      ),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Color(0xff3C3F41)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, "/stok");
                        },
                        child: Image.asset(
                          "asset/add-items.png",
                        )),
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
                SizedBox(height: 24,width: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 544,
                      height: 72,
                      child: TextField(
                        controller: addProvider.controller,
                        onSubmitted: addProvider.onSubmitted,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.qr_code_2,
                              color: Colors.white, size: 32),
                          fillColor: Color(0xff3C3F41),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32)),
                            borderSide: BorderSide(color: Color(0xFF212425)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32)),
                            borderSide: BorderSide(color: Color(0xFF212425)),
                          ),
                        ),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
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
    return Column(
      children: [
        Row(
          children: [
            FastAccessButton(buttonText: "عصير", price: 3.5,),
            FastAccessButton(buttonText: "حليب", price: 4.5,),
            FastAccessButton(buttonText: "قهوة", price: 8,),
          ],
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 17)),
        Row(
          children: [
            FastAccessButton(buttonText: "كربون", price: 1.5,),
            FastAccessButton(buttonText: "دقيق شعير", price: 4,),
            FastAccessButton(buttonText: "اكواب بلاستيك", price: 2,),
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
  final double price;
  FastAccessButton({super.key, required this.buttonText, required this.price});

  @override
  Widget build(BuildContext context) {
    final addProvider = Provider.of<ProductProvider>(context);
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
            onPressed: () {
              addProvider.addProduct(Product(name:  buttonText , price: price, barcode: 12864118546464, quantity: 1));
            },
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
  late String _text;

  @override
  void initState() {
    super.initState();
    final myProvider = Provider.of<ProductProvider>(context, listen: false);
    _text = myProvider.text;
    myProvider.addListener(_updateText);
  }

  @override
  void dispose() {
    final myProvider = Provider.of<ProductProvider>(context, listen: false);
    myProvider.removeListener(_updateText);
    super.dispose();
  }

  void _updateText() {
    final myProvider = Provider.of<ProductProvider>(context, listen: false);
    setState(() {
      _text = myProvider.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final addProvider = Provider.of<ProductProvider>(context);
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
            const Text("سلة المشتريات",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold)),
            Expanded(
              child: Container(
                width: 414,
                child: StreamBuilder<List<Product>>(
                  stream: addProvider.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    }
                    List<Product> products = snapshot.data!;
                    return ListView.builder(
                      controller: addProvider.scrollController,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return CartItem(name: products[index].name,price: products[index].price,index: index,);
                      },
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${addProvider.totalPrice}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 16)),
                  const Text("الاجمالي",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight.bold)),
                  const Padding(padding: EdgeInsets.only(left: 8)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child:
              Container(
                width: 384,
                child:
                ElevatedButton(
                    onPressed:
                        () {
                      addProvider.saveReceipt();
                      addProvider.removeAllProduct();
                        },
                    style:
                    ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(
                          const Color(0xffFAF950)),
                    ),
                    child:
                    const Text("دفع",
                        style:
                        TextStyle(color:
                        Colors.black,
                            fontSize:
                            44,
                            fontWeight:
                            FontWeight.bold))),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final name;
  final price;
  final index;
  const CartItem({super.key, this.name, this.price, this.index});

  @override
  Widget build(BuildContext context) {
    final addProvider = Provider.of<ProductProvider>(context);
    return Padding(
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
                  onPressed: () {
                    addProvider.removeProductAt(index);
                  },
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
              Expanded(
                child: Text("$price",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
              Text(name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              const Padding(padding: EdgeInsets.only(left: 24))
            ],
          ),
        ),
      ),
    );
  }
}
