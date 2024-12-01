import Foundation

struct Video {
    let title: String
    let views: Int
    let url: String
}

func generateSampleVideos() -> [Video] {
    return [
        Video(title: "Swift Programming", views: 5000, url: "https://example.com/video1"),
        Video(title: "SwiftUI Basics", views: 3200, url: "https://example.com/video2"),
        Video(title: "iOS Development", views: 4200, url: "https://example.com/video3"),
        Video(title: "Animations in SwiftUI", views: 2900, url: "https://example.com/video4"),
        Video(title: "Networking in Swift", views: 1500, url: "https://example.com/video5"),
        Video(title: "Advanced Swift Techniques", views: 3700, url: "https://example.com/video6"),
        Video(title: "Debugging in Xcode", views: 2500, url: "https://example.com/video7"),
        Video(title: "Introduction to Combine", views: 1800, url: "https://example.com/video8"),
        Video(title: "Swift for Beginners", views: 4500, url: "https://example.com/video9"),
        Video(title: "Building Apps with Swift", views: 6000, url: "https://example.com/video10")
    ]
}

func printVideos(videos: [Video]) {
    for (index, video) in videos.enumerated() {
        print("\(index + 1). Назва: \(video.title), Перегляди: \(video.views)")
    }
}

func searchVideos(by title: String, in videos: [Video]) -> [Video] {
    return videos.filter { $0.title.lowercased().contains(title.lowercased()) }
}

func sortVideosByViewsDescending(videos: [Video]) -> [Video] {
    return videos.sorted { $0.views > $1.views }
}

func main() {
    let videos = generateSampleVideos()
    while true {
        print("\nВітаємо! Оберіть дію:")
        print("1. Показати всі відео")
        print("2. Знайти відео за назвою")
        print("3. Показати відео за кількістю переглядів (спадання)")
        print("4. Вийти")
        if let choice = readLine(), let option = Int(choice) {
            switch option {
            case 1:
                print("\nСписок відео:")
                printVideos(videos: videos)
            case 2:
                print("\nВведіть назву для пошуку:")
                if let searchText = readLine() {
                    let searchResults = searchVideos(by: searchText, in: videos)
                    if searchResults.isEmpty {
                        print("\nРезультати пошуку відсутні.")
                    } else {
                        print("\nРезультати пошуку:")
                        printVideos(videos: searchResults)
                    }
                }
            case 3:
                print("\nВідео, відсортовані за переглядами (спадання):")
                let sortedVideos = sortVideosByViewsDescending(videos: videos)
                printVideos(videos: sortedVideos)
            case 4:
                print("\nДо побачення!")
                return
            default:
                print("\nНевірний вибір. Спробуйте ще раз.")
            }
        }
    }
}

main()
