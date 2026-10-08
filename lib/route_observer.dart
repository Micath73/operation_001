import 'package:flutter/material.dart';

/// App-wide route observer to trigger `didPopNext` lifecycle callbacks
/// on active screens when navigating back to them.
final RouteObserver<PageRoute> appRouteObserver = RouteObserver<PageRoute>();