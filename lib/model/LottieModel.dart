//https://api.lottiefiles.com/
//interface LottiefilesApi {
import 'package:a_http/a_http.dart';
import 'package:autility/autility.dart';
import 'package:autility/utility/a_log.dart';

import 'page_memory_cache.dart';

////@GET("v1/recent")
////suspend fun getRecent(@Query("page") page: Int): AnimationResponse
////
////@GET("v1/popular")
////suspend fun getPopular(@Query("page") page: Int): AnimationResponse
////
////@GET("v2/featured")
////suspend fun getCollection(): AnimationResponseV2
////
////@GET("v1/search/{query}")
////suspend fun search(@Path("query") query: String, @Query("page") page: Int): AnimationResponse
////}
class LottieModel<T> {
  final PageMemoryCache _featureCache;
  final PageIter _iter;
  final Serializable _serializable;
  final String _api;

  LottieModel(this._api, this._serializable, {int pageCount})
      : _iter = PageIter(pageCount ?? 99, 0), _featureCache = PageMemoryCache(pageCount ?? 99);

  Future loadNextPage() async {
    final page = _featureCache.getNextPage(_iter);
    final result = await AHttp.get(_api,
        params: {"page": page}, serializable: _serializable).catchError((err){});

    if (null != result) {
      _iter.addPage(page);
      _featureCache.addPage(page, result);
    }
  }

  int get count {
    return _featureCache.getCount(_iter);
  }

  T getData(int index) {
    return _featureCache.getInfoData(_iter, index);
  }
}
