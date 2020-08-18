package results

// Store manages the storage and export of results information
type Store interface {
	AddResult(violation *Violation)
	GetResults() []*Violation
}

type Result interface {
	Add(violation *Violation)
	GetAll() []*Violation
}
