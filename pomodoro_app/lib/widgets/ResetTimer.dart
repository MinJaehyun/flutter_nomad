import 'package:flutter/material.dart';

class ResetTimer extends StatelessWidget {
  final resetValues;
  final resetValue;
  // todo: void Function() 처리하지 않고 사용하는 방법.. 검색해보기
  final selectedView;
  const ResetTimer({super.key, required this.resetValues, required this.selectedView, required this.resetValue});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(viewportFraction: 0.3);

    return Container(
      // note: 사이즈 조정 styleFrom()에서 안 되므로, 컨테이너의 사이즈를 줄여서 해결
      height: 100.0,
      width: double.infinity,
      // note: page view
      child: PageView.builder(
        controller: controller,
        itemCount: resetValues.length,
        itemBuilder: (_, index) {
          return Row(
            children: [
              Container(
                child: OutlinedButton(
                  onPressed: () {
                    // note: 시간 클릭 시, 해당 시간으로 선택한 화면 나타냄
                    selectedView(index);
                  },
                  style: OutlinedButton.styleFrom(
                    // 선택한 시간과 현재 시간이 일치하면? 배경색 및 글자 색상을 구분하여 지정한다
                    backgroundColor: resetValues[index] == resetValue ? Colors.white : Colors.redAccent,
                    // note: OutlinedButton.styleFrom 내 라인 설정
                    side: BorderSide(width: 2, color: Colors.white.withOpacity(0.5)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  // 선택한 시간 25 과 나머지 시간들
                  child: Text(
                    '${resetValues[index]}',
                    style: TextStyle(
                      // 선택한 시간과 현재 시간이 일치하면? 배경색 및 글자 색상을 구분하여 지정한다
                        color: resetValues[index] == resetValue ? Colors.redAccent : Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
