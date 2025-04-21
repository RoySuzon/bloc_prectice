import 'dart:math';

import 'package:flutter/material.dart';

class SilverAppBarDemo extends StatelessWidget {
  const SilverAppBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // SliverAppBar(

          //   pinned: true,
          //   expandedHeight: 200,

          //   flexibleSpace: FlexibleSpaceBar(
          //       background: Image.network(
          //         "https://cdn.pixabay.com/photo/2018/08/04/11/30/draw-3583548_1280.png",
          //         fit: BoxFit.cover,
          //       ),
          //       title: const Text('Title is here...',
          //           style: TextStyle(color: Colors.white))),
          // ),
          const SliverAppBar(
            // automaticallyImplyLeading: false,
            // pinned: true,
            // floating: true,
            expandedHeight: 150,
            backgroundColor: Colors.brown,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('\$50,000',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    Text('Current Balance',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                title: Text('Wallet',
                    style: TextStyle(color: Colors.white, fontSize: 12))),
            // centerTitle: true,
          ),

          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            toolbarHeight: 100,
            expandedHeight: 100,
            // backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Quick Actions',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.send, size: 30)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.receipt, size: 30)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add, size: 30)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.settings, size: 30)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
            ),
            sliver: SliverToBoxAdapter(
              child: Text('Recent Transactions',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {
                Random random = Random();

                int amount = random.nextInt(500);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    child: ListTile(
                      trailing: Text(
                        index.isEven
                            ? "\$${amount.toString()}"
                            : "- \$${amount.toString()}",
                        style: TextStyle(
                            color: index.isEven ? Colors.green : Colors.red),
                      ),
                      title: Text('Transaction ${index + 1}'),
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                            index.isEven
                                ? Icons.arrow_upward
                                : Icons.arrow_downward,
                            color: index.isEven ? Colors.green : Colors.red),
                      ),
                    ),
                  ),
                );
              },
              childCount: 20,
            )),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 16),
            sliver: SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Text('No more transactions'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
