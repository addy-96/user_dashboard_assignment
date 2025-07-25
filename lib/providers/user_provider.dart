import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user_dashboard/model/user_profile.dart';
import 'package:user_dashboard/service/services.dart';

enum SortType { az, za }

class UserProvider with ChangeNotifier {
  UserProvider({required this.services});

  String? _selectedProfilePicPath;
  String? get selectedProfilePicPath => _selectedProfilePicPath;

  String? _selectedGender;
  String? get selectedGender => _selectedGender;
  set setGender(String gender) {
    _selectedGender = gender;
  }

  final Services services;

  SortType _currentSort = SortType.az;
  SortType get currentSort => _currentSort;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  List<UserProfile> _userProfiles = [];
  List<UserProfile> get userProfile => _userProfiles;

  List<UserProfile> _userBuffer = [];
  List<UserProfile> get userBuffer => _userBuffer;

  final TextEditingController _searchController = TextEditingController();

  TextEditingController get searchController => _searchController;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future loadUser() async {
    try {
      _isLoading = true;
      notifyListeners();
      _userProfiles = await services.fetchUser();
      _isLoading = false;
      sortUser(_currentSort);
      notifyListeners();
    } catch (err) {
      throw Exception('Error occured: ${err.toString()}');
    }
  }

  void searchUserRequested() {
    if (_searchController.text.isEmpty) {
      notifyListeners();
      return;
    } else {
      _userBuffer = userProfile.where((user) {
        final name = '${user.name.first} ${user.name.last}'.toLowerCase();
        return name.contains(searchController.text.trim().toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  void sortUser(SortType sortType) {
    _currentSort = sortType;
    if (_currentSort == SortType.az) {
      userProfile.sort((a, b) => a.name.first.compareTo(b.name.first));
    } else {
      userProfile.sort((a, b) => b.name.first.compareTo(a.name.first));
    }
    notifyListeners();
  }

  Future<void> selectProfilePicture() async {
    final pickImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickImage == null) {
      _selectedProfilePicPath = null;
      return;
    }
    _selectedProfilePicPath = pickImage.path;
    notifyListeners();
  }

  bool addUser({required UserProfile userProfile}) {
    try {
      _userProfiles.add(userProfile);
      _selectedProfilePicPath = null;
      _selectedGender = null;
      notifyListeners();
      return true;
    } catch (err) {
      notifyListeners();
      return false;
    }
  }
  
}
