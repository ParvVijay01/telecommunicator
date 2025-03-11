import 'package:flutter_svg/flutter_svg.dart';
import 'package:lookme/components/common/touch_spin.dart';
import 'package:lookme/components/product/product_card.dart';
import 'package:lookme/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/svg.dart';

class ProductCart extends StatefulWidget {

  final String title;
  final String price;
  final String oldPrice;
  final String image;
  final String count;
  final String review;
  final dynamic id;
  final String offer;
  final String? inWishlist;
  final bool? orderStatusRemove;
  final String? orderStatus;
  final String? orderRated;
  final Function()? removePress;
  final String? quantity;

  const ProductCart({super.key, 
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.image,
    required this.count,
    required this.review,
    required this.offer,
    this.quantity,
    this.id,
    this.inWishlist,
    this.orderStatusRemove,
    this.orderStatus,
    this.orderRated,
    this.removePress,
  });

  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {

  late dynamic _isWishlist;

  @override
  void initState(){
    super.initState();
    _isWishlist = widget.inWishlist == '1' ? true : false;
  }

  @override
  Widget build(BuildContext context){
    return Container(
      color: Theme.of(context).cardColor,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/product_detail', arguments: ScreenArguments(
                  widget.id 
                )
              );
            },
            child: Row(
              children: [
                Stack(
                  children: [
                      SizedBox(
                        width: 120,
                        height: 140,
                        child:  Image.asset(widget.image,width: double.infinity,height: double.infinity, fit: BoxFit.cover,),
                      ),
                      Positioned(
                        left: -5,
                        top: -5,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _isWishlist = !_isWishlist;
                            });
                          }, 
                          iconSize: 20,
                          icon: SvgPicture.string(
                            IKSvg.heart,
                            width: 16,
                            height: 16,
                            // ignore: deprecated_member_use
                            color: _isWishlist ? IKColors.danger : IKColors.title.withOpacity(0.3),
                          ), 
                        ),
                      ), 
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.title,maxLines: 1, style:Theme.of(context).textTheme.titleMedium?.merge(TextStyle(fontSize: 15))),
                        const SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Text('\$${widget.price}',style: Theme.of(context).textTheme.titleLarge?.merge(TextStyle(fontSize: 16))),
                            const SizedBox(width: 6),
                            Text('\$${widget.oldPrice}',style: Theme.of(context).textTheme.bodySmall?.merge( TextStyle(decoration: TextDecoration.lineThrough,fontWeight: FontWeight.w300,color:Theme.of(context).brightness == Brightness.dark ? Color.fromRGBO(255, 255, 255, 0.70) : Color.fromARGB(255, 70, 70, 70) ))),
                            const SizedBox(width: 6),
                            widget.quantity != null  ? 
                            Text('Qty:',style: Theme.of(context).textTheme.bodySmall?.merge( TextStyle(fontWeight: FontWeight.w300,color: Theme.of(context).textTheme.titleMedium?.color )),)
                            :
                            const Icon(
                              Icons.star,
                              size: 16,
                              color: Color(0xFFFFA048),
                            ),
                            const SizedBox(width: 6),
                            widget.quantity != null  ? 
                            Text(widget.quantity!, maxLines: 1,style: Theme.of(context).textTheme.bodySmall?.merge( TextStyle(fontWeight: FontWeight.w300,color: Theme.of(context).textTheme.titleMedium?.color )),)
                            :
                            Text(widget.review, maxLines: 1,style: Theme.of(context).textTheme.bodySmall?.merge( TextStyle(fontWeight: FontWeight.w300,color:Theme.of(context).brightness == Brightness.dark ? Color.fromRGBO(255, 255, 255, 0.50) : Color.fromARGB(255, 50, 50, 50) )),),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.all(0),
                          child: 
                           widget.orderStatus == 'ongoing' ?
                            Text('In Delivery',style:Theme.of(context).textTheme.bodyMedium?.merge(TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: IKColors.success)))
                            :
                            widget.orderStatus == 'completed' ? 
                            Text('Delivery',style:Theme.of(context).textTheme.bodyMedium?.merge(TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: IKColors.success)))
                            :
                            Text('FREE Delivery',style:Theme.of(context).textTheme.bodyMedium?.merge(TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: IKColors.success)))
                           
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                              widget.orderStatus == 'ongoing' ?
                                 Text(widget.offer, style: Theme.of(context).textTheme.titleMedium?.merge(TextStyle(fontWeight: FontWeight.w500, color: IKColors.primary)),)
                              :
                              widget.orderStatus == 'completed' ?
                                 Text(widget.offer, style: Theme.of(context).textTheme.titleMedium?.merge(TextStyle(fontWeight: FontWeight.w500, color: IKColors.primary)),)
                              :
                              TouchSpin(
                                count : widget.count
                              ),
                              if(widget.orderStatusRemove != true )
                              widget.orderStatus == 'ongoing' ?
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/track_order');
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 15),
                                  color:Theme.of(context).canvasColor,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Track Order',style: Theme.of(context).textTheme.titleLarge?.merge(TextStyle(fontSize: 13)))
                                    ],
                                  ),
                                ),
                              )
                              :
                              widget.orderStatus == 'completed' ?
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/write_review');
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 15),
                                  color:Theme.of(context).canvasColor,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Write Review',style: Theme.of(context).textTheme.titleLarge?.merge(TextStyle(fontSize: 13)))
                                    ],
                                  ),
                                ),
                              )
                              :
                              GestureDetector(
                                onTap: widget.removePress,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.delete_outline,
                                        size: 20,
                                        color: IKColors.primary,
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Text('Remove',style:Theme.of(context).textTheme.bodyMedium?.merge(TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: IKColors.primary)))
                                    ],
                                  )
                                ),
                              )
                          ],
                        )
                      ], 
                    ),
                  ),
                )
              ],
            ),
          ),
          // Container(
          //   decoration: BoxDecoration(
          //     border: Border(top: BorderSide(width: 1,color: Theme.of(context).dividerColor))
          //   ),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         flex: 4,
          //         child: Container(
          //           padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 10),
          //           decoration: BoxDecoration(
          //             border: Border(right: BorderSide(width: 1,color: Theme.of(context).dividerColor))
          //           ),
          //           child: 
          //           bottomOption == 'order' ?
          //           (
          //             orderStatus == 'completed' ?
          //             Padding(
          //               padding: const EdgeInsets.all(7.0),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   const Icon(Icons.check_circle,size: 16,color: IKColors.success),
          //                   const SizedBox(width: 3),
          //                   Text('Completed',style: Theme.of(context).textTheme.bodyMedium?.merge(const TextStyle(color: IKColors.success)))
          //                 ],
          //               ),
          //             )
          //             :
          //             GestureDetector(
          //               onTap: () {
          //                 Navigator.pushNamed(context, '/track_order');
          //               },
          //               child: Padding(
          //                 padding: const EdgeInsets.symmetric(vertical: 7.0),
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     SvgPicture.string(
          //                       IKSvg.truck2,
          //                       width: 14,
          //                       height: 14,
          //                       // ignore: deprecated_member_use
          //                       color: IKColors.primary,
          //                     ),
          //                     const SizedBox(width: 3),
          //                     Text('Track Order',style: Theme.of(context).textTheme.bodyMedium)
          //                   ],
          //                 ),
          //               ),
          //             )
          //           )
          //           :
          //           TouchSpin(
          //             count : count
          //           ),
          //         )
          //       ),
          //       Expanded(
          //         flex: 5,
          //         child: GestureDetector(
          //           onTap: () {
          //             bottomOption == 'order' ?
          //               orderStatus == 'completed' ?
          //                 Navigator.pushNamed(context, '/write_review')
          //                 :
          //                 null
          //             :
          //             Navigator.pushNamed(context, '/wishlist');
          //           },
          //           child: Container(
          //             padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          //             decoration: BoxDecoration(
          //               border: Border(right: BorderSide(width: 1,color: Theme.of(context).dividerColor))
          //             ),
          //             child: 
          //             bottomOption == 'order' ?
          //             (
          //               orderStatus == 'completed' ?
          //               (
          //                 orderRated == 'yes' ?
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     const Icon(Icons.star,size: 15,color: Color(0xFFFFAC5F)),
          //                     const SizedBox(width: 2),
          //                     Text('4.5',style: Theme.of(context).textTheme.titleMedium?.merge(const TextStyle(fontWeight: FontWeight.w400))),
          //                     Text(' Edit Review',style: Theme.of(context).textTheme.bodyMedium?.merge(const TextStyle(decoration: TextDecoration.underline,decorationColor: IKColors.primary,color: IKColors.primary))),
          //                   ],
          //                 )
          //                 :
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     const Icon(Icons.star,size: 15,color: Color(0xFFFFAC5F)),
          //                     const SizedBox(width: 2),
          //                     Text('Write Review',style: Theme.of(context).textTheme.titleMedium?.merge(const TextStyle(fontWeight: FontWeight.w400)))
          //                   ],
          //                 )
          //               )
          //               :
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   Icon(Icons.star,size: 15,color: Theme.of(context).textTheme.bodyMedium?.color),
          //                   const SizedBox(width: 2),
          //                   Text('Write Review',style: Theme.of(context).textTheme.bodyMedium)
          //                 ],
          //               )
          //             )
          //             :
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 SvgPicture.string(
          //                   IKSvg.save,
          //                   width: 20,
          //                   height: 20,
          //                 ),
          //                 const SizedBox(
          //                   width: 4,
          //                 ),
          //                 Text('Save for later',style:Theme.of(context).textTheme.bodyMedium),
          //               ],
          //             )
          //           ),
          //         )
          //       ),
          //       Expanded(
          //         flex: 4,
          //         child: GestureDetector(
          //           onTap: removePress,
          //           child: Container(
          //             padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 const Icon(
          //                   Icons.delete_outline,
          //                   size: 20,
          //                   color: IKColors.primary,
          //                 ),
          //                 const SizedBox(
          //                   width: 2,
          //                 ),
          //                 Text('Remove',style:Theme.of(context).textTheme.bodyMedium?.merge(TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: IKColors.primary)))
          //               ],
          //             )
          //           ),
          //         )
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}