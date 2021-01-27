// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class PopularMoviesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query PopularMovies {
      popularMovies {
        __typename
        id
        posterPath
        title
        releaseDate
        overview
        backdropPath
        voteAverage
      }
    }
    """

  public let operationName: String = "PopularMovies"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("popularMovies", type: .list(.object(PopularMovie.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(popularMovies: [PopularMovie?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "popularMovies": popularMovies.flatMap { (value: [PopularMovie?]) -> [ResultMap?] in value.map { (value: PopularMovie?) -> ResultMap? in value.flatMap { (value: PopularMovie) -> ResultMap in value.resultMap } } }])
    }

    public var popularMovies: [PopularMovie?]? {
      get {
        return (resultMap["popularMovies"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [PopularMovie?] in value.map { (value: ResultMap?) -> PopularMovie? in value.flatMap { (value: ResultMap) -> PopularMovie in PopularMovie(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [PopularMovie?]) -> [ResultMap?] in value.map { (value: PopularMovie?) -> ResultMap? in value.flatMap { (value: PopularMovie) -> ResultMap in value.resultMap } } }, forKey: "popularMovies")
      }
    }

    public struct PopularMovie: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Movie"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("posterPath", type: .scalar(String.self)),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("releaseDate", type: .scalar(String.self)),
          GraphQLField("overview", type: .scalar(String.self)),
          GraphQLField("backdropPath", type: .scalar(String.self)),
          GraphQLField("voteAverage", type: .scalar(Double.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, posterPath: String? = nil, title: String? = nil, releaseDate: String? = nil, overview: String? = nil, backdropPath: String? = nil, voteAverage: Double? = nil) {
        self.init(unsafeResultMap: ["__typename": "Movie", "id": id, "posterPath": posterPath, "title": title, "releaseDate": releaseDate, "overview": overview, "backdropPath": backdropPath, "voteAverage": voteAverage])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var posterPath: String? {
        get {
          return resultMap["posterPath"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "posterPath")
        }
      }

      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var releaseDate: String? {
        get {
          return resultMap["releaseDate"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "releaseDate")
        }
      }

      public var overview: String? {
        get {
          return resultMap["overview"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "overview")
        }
      }

      public var backdropPath: String? {
        get {
          return resultMap["backdropPath"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "backdropPath")
        }
      }

      public var voteAverage: Double? {
        get {
          return resultMap["voteAverage"] as? Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "voteAverage")
        }
      }
    }
  }
}
