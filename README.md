# Generic Data Structures in C

이 프로젝트는 C언어에서 쓸 수 있는 Generic Map과 Generic List를 제공합니다.
Generic Map과 Generic List에는 Data Type을 담을 수 있습니다.

## 사용법

Generic List에서 제공하는 API 함수들은 다음과 같습니다.
* L_CREATE(size, desc) -- list 생성
* L_DESTROY(list) -- list 소멸
* L_ADD(list, elem) -- list에 element 추가
* L_FIND(list, elem) -- list에서 element의 위치를 찾기
* L_REMOVE(list, idx, p_elem_removed) -- list에서 idx번째 element를 지우고 지워진 element를 받아 오기
* L_RETR(list, idx, p_elem_result) -- list에서 idx번째 element를 받아 오기
* L_INSERT(list, idx, elem) -- list의 idx 위치에 element를 insert하기
* L_HAS(list, elem) -- list가 element를 포함하고 있는지 여부 확인
* L_DELETE(list, idx) -- list의 idx번째 element 지우기
* L_COUNT(list) -- list가 가지고 있는 element 개수
* L_SORT(list, compare_f) -- list sort하기

Generic Map이 제공하는 API 함수들은 다음과 같습니다.
* M_CREATE(K_size, K_desc, V_size, V_desc) -- generic map 생성
* M_DESTROY(map) -- map 소멸
* M_PUT(map, key, value) -- map에 key, value 쌍 추가하기
* M_RETR(map, key, p_value) -- map에서 key에 해당하는 value를 읽어 오기
* M_HAS(map, key) -- map이 key를 가지고 있는지 확인
* M_ITER(map) -- map에 쓸 수 있는 iterator 생성
* I_NEXT(iter) -- iterator를 다음으로 이동
* I_VALUE(iter, p_value) -- iterator에서 value를 읽어 오기
* I_KEY(iter, p_key) -- iterator에서 key를 읽어 오기
* M_DEL(map, key) -- map에서 key에 해당하는 항목 지우기
* M_COUNT(map) -- map이 포함하는 key, value 쌍의 개수
* M_KEYS(map) -- map에 있는 key의 list를 가져오기