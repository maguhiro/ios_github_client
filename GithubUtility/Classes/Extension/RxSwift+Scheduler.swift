import RxSwift

public enum SchedulerType {
  case main
  case io

  private static let mainScheduler = MainScheduler.instance
  private static let ioScheduler = SerialDispatchQueueScheduler(qos: .background)

  fileprivate var scheduler: RxSwift.SchedulerType {
    switch self {
    case .main:
      return SchedulerType.mainScheduler
    case .io:
      return SchedulerType.ioScheduler
    }
  }
}

public extension ObservableType {
  func observeOn(type: SchedulerType) -> Observable<Self.Element> {
    return observeOn(type.scheduler)
  }

  func subscribeOn(type: SchedulerType) -> Observable<Self.Element> {
    return subscribeOn(type.scheduler)
  }
}

public extension PrimitiveSequence {
  func observeOn(type: SchedulerType) -> PrimitiveSequence<Trait, Element> {
    return observeOn(type.scheduler)
  }

  func subscribeOn(type: SchedulerType) -> PrimitiveSequence<Trait, Element> {
    return subscribeOn(type.scheduler)
  }
}
