import 'package:flutter/material.dart';
import 'package:flutter_e_catalog/data/models/response/product_response_model.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({
    super.key,
    required this.product,
  });

  final ProductResponseModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(product.title ?? ''),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  '\$ ${product.price}',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                product.description ?? '',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  product.category!.name.toString(),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: product.images!.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.redAccent,
                    child: Image(
                      image: NetworkImage(product.images![index]),
                      fit: BoxFit.cover,
                    ),
                  );
                },
              )
            ],
          ),
        ));
  }
}
