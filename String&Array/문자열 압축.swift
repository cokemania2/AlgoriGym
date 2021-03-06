/*
*  문자열 압축.swift
*  Question Link: https://programmers.co.kr/learn/courses/30/lessons/60057
*  Primary idea:   <Brute force>
*                  1. 문자열을 다룰 수 있고, 아래 예시와 같이 문자열과 관련된 다양한 작업을 할 수 있는지 파악
*                       1) 문자열 자르기 - 문자열 길이가 N일 때, 길이가 N/2 보다 크게 잘랐을 때는 길이가 줄지 않음
*                       2) 부분 문자열 얻기
*                       3) 문자열 비교하기
*                       4) 문자열 길이 얻기
*                  2. 점수 올리기
*                       1) 배열의 길이가 1일경우, upperBound < lowerBound 방지 -> 60점
*                       2) 제약조건에서 1000 이하이기 때문에 초기 guard가 '<'가 아닌 '<='로 바꾸어야함 - 66점
*                       3) 같은 숫자가 연속으로 들어올 경우
*
*  Time Complexity: O(n^2)
*  Space Complexity: O(n)
*  result : 100점
*
*  Created by gunhyeong on 2020/03/12.
*/

import Foundation

func solution(_ s:String) -> Int {
    guard s.count > 0 && s.count <= 1000 else { // Constraints : 1~1000
        return 0
    }
    
    if s.count == 1 { // 1개일 경우, 방지 : upperBound < lowerBound
        return 1
    }
    
    let s = Array(s)
    var result = 99999
        
    for cut in 1...(s.count/2) { // 1-1) 문자열 자르기 범위 설정
        var cnt = 1, endIndex = 0
        var targetLetters = String(s[0..<cut]) // 1-2) 부분 문자열 얻기
        var currentLetters = ""
                
        for letters in stride(from: cut, through: s.count, by: cut) where letters+cut <= s.count { // 1-4) 문자열 길이 얻기
            let compare = String(s[letters..<(letters+cut)]) // 1-2) 부분 문자열 얻기
            if targetLetters == compare { // 1-3) 문자열 비교하기
                cnt += 1
            } else {
                if cnt == 1 {
                    currentLetters += targetLetters
                    targetLetters = compare
                } else {
                    currentLetters += String(cnt) + targetLetters
                    targetLetters = compare
                    cnt = 1
                }
            }
            
            if letters+cut >= s.count {
                if cnt == 1 {
                    currentLetters += targetLetters
                } else {
                    currentLetters += String(cnt) + targetLetters
                }
            }
            endIndex = letters
        }
        
        if s.count % cut != 0{ // 마지막 문자열 처리
            if cnt > 1 { // 2-3) 같은 숫자가 연속으로 들어올 경우
                currentLetters = String(cnt) + currentLetters + String(s[endIndex..<s.count])
            } else {
                currentLetters += String(s[endIndex..<s.count])
            }
        }
        
        if (currentLetters.count < result) { // min 내부 함수 쓰지 않기
            result = currentLetters.count
        }
    }
    
    return result
}
