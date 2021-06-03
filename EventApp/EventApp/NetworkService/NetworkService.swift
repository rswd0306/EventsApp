//
//  NetworkService.swift
//  EventApp

protocol NetworkService {
    func getEventSearchList(endpoint: EventEndpoint, onSuccess: @escaping(ClsEventModel) -> Void, onFailure: @escaping(Error) -> Void)
}
