//
//  기능개발.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42586
//  Primary idea:       <String & Array> - Queue
//                      1. 첫 번째 반복문을 통해 각 progresse의 최종 배포일을 알아내 배열에 담아낸다.
//                      2. 배포일을 알아냄과 동시에 queue에 넣어 더 큰 배포일이 올때까지 반복한다.
//                         더 큰 배포일이 왔을 경우 : 결과값에 방금 넣은 더 큰 배포일을 제외하고 값을 넣어준다. 그후 큐를 클리어하고 방금 제외한 더 큰 배포일을 queue의 가장 앞에 넣는다.
//
//  Time Complexity : O(n)
//  Space Complexity : O(n)
//  Runtime: 0.17 ~ 0.26 ms
//  Memory Usage: 24.0. 24.4 MB
//
//  Created by gunhyeong on 2020/06/22.
//

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
        var result = [Int]()
        var distributeQueue = [Int]()
        
        for i in 0..<progresses.count {
            var progresse = progresses[i]
            var cnt = 0
            
            while progresse < 100 {
                progresse += speeds[i]
                cnt += 1
            }
            
            distributeQueue.append(cnt)
            
            if distributeQueue.first! < cnt {
                result.append(distributeQueue.count-1) // 결과값에 방금 넣은 값을 제외하고 넣어준다.
                distributeQueue.removeAll()
                distributeQueue.append(cnt) // 방금 제외한 값을 다시 queue에 넣어준다.
            }
        }
        
        result.append(distributeQueue.count)

        return result
    }
