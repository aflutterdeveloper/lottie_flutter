class PageMemoryCache<T> {
  final int _maxPage;
  final int _pageSize = 16;

  PageMemoryCache(this._maxPage);

  Map<int, List<T>> _cacheList =
      Map<int, List<T>>();

  void addPage(int page, List<T> list) {
    _cacheList[page] = list;
  }

  void clear() {
    _cacheList.clear();
  }

  PageIter getPageIter(bool reverse, int anchorPage) {
    if (reverse) {
      return ReverseIter(_maxPage, anchorPage ?? (_maxPage - 1));
    } else {
      return PageIter(_maxPage, anchorPage ?? 0);
    }
  }

  int getNextPage(PageIter iter) {
    final page = iter.lastPage();
    if (_cacheList.containsKey(page)) {
      return iter.nextPage();
    } else {
      return page;
    }
  }

  int getPrePage(PageIter iter) {
    final page = iter.firstPage();
    if (_cacheList.containsKey(page)) {
      return iter.prePage();
    } else {
      return page;
    }
  }

  T getInfoData(PageIter iter, int index) {
    if (iter is ReverseIter) {
      int count = 0;
      for (int i = iter.firstPage(); i >= iter.lastPage(); --i) {
        final l = _cacheList[i];
        if (l != null) {
          if (index < count + l.length) {
            return l[l.length - (index - count + 1)];
          }
          count += l.length;
        } else {
          break;
        }
      }
    } else {
      int count = 0;
      for (int i = iter.firstPage(); i <= iter.lastPage(); ++i) {
        final l = _cacheList[i];
        if (l != null) {
          if (index < count + l.length) {
            return l[index - count];
          }
          count += l.length;
        } else {
          break;
        }
      }
    }
    return null;
  }

  int getCount(PageIter iter) {
    int count = 0;
    if (iter is ReverseIter) {
      for (int i = iter.lastPage(); i <= iter.firstPage(); ++i) {
        final l = _cacheList[i];
        if (l != null) {
          count += l.length;
        }
      }
    } else {
      for (int i = iter.firstPage(); i <= iter.lastPage(); ++i) {
        final l = _cacheList[i];
        if (l != null) {
          count += l.length;
        }
      }
    }
    return count;
  }

  List<T> getPage(int page) {
    return _cacheList[page];
  }

  T getInfoDataByIndex(int chapterIndex) {
    final page = (chapterIndex / _pageSize).floor();
    final list = _cacheList[page];
    if (null == list) {
      return null;
    }
    int index = chapterIndex % _pageSize;
    if (index < list.length) {
      return list[index];
    }
    return list.last;
  }
}

class PageIter {
  final int pageCount;
  final int anchorPage;
  final List<int> pageList = List<int>();

  PageIter(this.pageCount, this.anchorPage) {
    pageList.add(anchorPage);
  }

  bool addPage(int page) {
    if (page == pageList.first - 1) {
      pageList.insert(0, page);
    } else if (page == pageList.last + 1) {
      pageList.add(page);
    } else {
      return false;
    }
    return true;
  }

  int lastPage() {
    if (pageList.isEmpty) {
      return 0;
    }
    return pageList.last;
  }

  int firstPage() {
    if (pageList.isEmpty) {
      return 0;
    }
    return pageList.first;
  }

  int prePage() {
    final pre = firstPage() - 1;
    if (pre >= 0) {
      return pre;
    }
    return null;
  }

  int nextPage() {
    final next = lastPage() + 1;
    if (next < pageCount) {
      return next;
    }
    return null;
  }
}

class ReverseIter extends PageIter {
  ReverseIter(int maxPage, int anchorPage) : super(maxPage, anchorPage);

  @override
  int firstPage() {
    return super.lastPage();
  }

  @override
  int lastPage() {
    return super.firstPage();
  }

  @override
  int prePage() {
    final page = firstPage() + 1;
    if (page < pageCount) {
      return page;
    }
    return null;
  }

  @override
  int nextPage() {
    final page = lastPage() - 1;
    if (page >= 0) {
      return page;
    }
    return null;
  }
}
