//
//  HealthKitManager.swift
//  FiveMinutes Watch App
//
//  Created by GAPT on 24/07/25.
//

import Foundation
import HealthKit

class HealthKitManager {
    
    static let shared = HealthKitManager()
    private let healthStore = HKHealthStore()
    
    // Pedir permiso al usuario para escribir datos de 'Minful Minutes'
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        guard HKHealthStore.isHealthDataAvailable() else {
            completion(false)
            return
        }
        
        guard let mindfulType = HKObjectType.categoryType(forIdentifier: .mindfulSession) else {
            completion(false)
            return
        }
        
        let typesToWrite: Set<HKSampleType> = [mindfulType]
        
        healthStore.requestAuthorization(toShare: typesToWrite, read: nil) { success, error in
            if let error = error {
                print("Error al solicitar autorización de HealthKit: \(error.localizedDescription)")
            }
            completion(success)
        }
    }
}
