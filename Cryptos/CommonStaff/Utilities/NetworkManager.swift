//
//  NetworkManager.swift
//  Cryptos
//
//  Created by Иван Карплюк on 25.09.2023.
//

import Foundation
import Combine

final class NetworkManager {
    
    enum NetworkingError: LocalizedError
    {
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(url: let url): return "[🤓] Bad response from URL: \(url)"
            case .unknown: return "[🥲] Unknown error occured"
            }
        }
    }
    
    /// Загружает данные по указанному URL и возвращает типизированного издателя (AnyPublisher) с данными или ошибкой.
    ///
    ///- Parameters:
    ///     - url: URL для загрузки данных.
    ///- Returns: Издатель (`AnyPublisher`), который будет издавать данные или ошибку.
    ///
    ///Пример использования:
    ///```
    ///let url = URL(string: "https://www.example.com/data.json")!
    ///
    ///download(url: url)
    ///.sink(receiveCompletion: { completion in handleCompletion(completion) },
    ///                         receiveValue: { data in // Обработка полученных данных })
    ///.store(in: &cancellables)
    ///```
    static func download(url: URL) -> AnyPublisher<Data, any Error>
    {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ try handleURLResponse(output: $0, url: url)})
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    ///Обрабатывает завершение потока издателя (Subscribers.Completion) и выполняет соответствующие действия в зависимости от результата.
    ///
    ///- Parameters:
    ///     - completion: Объект, представляющий результат завершения потока.
    ///
    ///Пример использования:
    ///```
    ///static func handleCompletion(completion: Subscribers.Completion<Error>) {
    ///     switch completion {
    ///     case .finished: // Поток успешно завершен, ничего не предпринимаем. break
    ///     case .failure(let error): // Возникла ошибка, выводим ее описание.
    ///         print(error.localizedDescription) }
    /// }
    ///```
    static func handleCompletion(completion: Subscribers.Completion<Error>)
    {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
    ///Обрабатывает ответ полученный издателем (`URLSession.DataTaskPublisher`), проверяет его на валидность и возвращает
    ///данные или выбрасывает ошибку вместе с ссылкой в случае неудачного ответа.
    ///
    ///- Parameters:
    ///     - output: Выходное значение издателя (`URLSession.DataTaskPublisher`), содержащее ответ и данные.
    ///     - url: URL адрес куда был отправлен запрос.
    ///- Throws: Ошибка, если ответ не является успешным HTTP-ответом.
    ///- Returns: Данные, полученные из ответа.
    ///
    ///Пример использования:
    ///```
    ///let response: URLSession.DataTaskPublisher.Output = // ...
    /// do { let data = try handleURLResponse(output: response) // Обработка полученных данных
    /// } catch {
    /// // Обработка ошибки
    /// }
    ///```
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL
    ) throws -> Data
    {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 &&
                response.statusCode < 300
        else {
            throw NetworkingError.badURLResponse(url: url)
        }
        return output.data
    }
    
}
