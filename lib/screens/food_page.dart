

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_app/components/my_button.dart';
import 'package:ticket_app/models/restaurant.dart';
import '../models/food.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon,bool> selectedAddons={};

  FoodPage({
    super.key,
    required this.food,
  }){
    //initialize selected addons to be false
    for(Addon addon in food.availableAddons){
      selectedAddons[addon]=false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  //method to add to cart
  void addToCart(Food food,Map<Addon,bool>selectedAddons){

    //close the current food page to go back to menu
    Navigator.pop(context);

    //format the selected addons
    List<Addon>currentlySelectedAddons=[];
    for(Addon addon in widget.food.availableAddons){
      if(widget.selectedAddons[addon] == true){
        currentlySelectedAddons.add(addon);
      }
    }
    //add to cart
    context.read<Restaurant>().addToCart(food,currentlySelectedAddons);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      //scaffold ui
      Scaffold(

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Food image
              Image.asset(widget.food.imagePath),
              // Food name
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Food name
                    Text(
                      widget.food.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),


                    // Food price
                    Text(
                      '\$' + widget.food.price.toString(),
                      style: TextStyle(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .primary,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Food description
                    Text(widget.food.description),
                    const SizedBox(height: 10),

                    Divider(color: Theme
                        .of(context)
                        .colorScheme
                        .secondary),
                    const SizedBox(height: 10),
                    Text(
                      "Add-ons",
                      style: TextStyle(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .inversePrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),


                    // Addons
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme
                                .of(context)
                                .colorScheme
                                .secondary
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: widget.food.availableAddons.length,
                        itemBuilder: (context, index) {
                          // Get individual addons
                          Addon addon = widget.food.availableAddons[index];
                          // Return checkbox UI
                          return CheckboxListTile(
                            title: Text(addon.name),
                            subtitle: Text(
                              '\$${addon.price}',
                              style: TextStyle(
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .primary,
                              ),
                            ),
                            value: widget.selectedAddons[addon],
                            onChanged: (bool? value) {
                              setState(() {
                                widget.selectedAddons[addon] = value!;
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ],

                ),
              ),
              // Add to the cart button
              MyButton(
                text: "Add to Cart",
                onTap: () => addToCart(
                  widget.food,
                  widget.selectedAddons
                ),
              ),

              const SizedBox(height: 25),
            ],
          ),


        ),
      ),


      //back button
      SafeArea(
        child: Opacity(
          opacity: 0.6,
          child: Container(
            margin: const EdgeInsets.only(left: 25),
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,
            shape:BoxShape.circle,
            ),

            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      )

    ],
    );
  }
  }

