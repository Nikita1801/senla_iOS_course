////
////  CollectionViewLayout.swift
////  SenlaTask4
////
////  Created by Никита Макаревич on 27.04.2022.
////
//
//import UIKit
//
//enum CollectionViewLayout{
//    func createHistoryLayout() -> UICollectionViewCompositionalLayout{
//        let currentLayout = UICollectionViewCompositionalLayout {sectionIndex, _ in
//            guard let section = StatisticSectionType.init(rawValue: sectionIndex) else {
//                fatalError("Error")
//            }
//        }
//    }
//
//}
//
//private extension CollectionViewLayout {
//    func buildSPSSection() -> NSCollectionLayoutSection {
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1.0))
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1.0))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
//        let section = NSCollectionLayoutSection(group: group)
//        let unitSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
//        let sectionSize = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: unitSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
//        section.boundarySupplementaryItems = [sectionSize]
//
//        return section
//    }
//}
