package results

// Store manages the storage and export of results information
type Store interface {
	AddResult(violation *Violation)
	GetResults() []*Violation
}

// Result stores violations that will be passed back to the writer interface
type Result interface {
	Add(violation *Violation)
	GetAll() []*Violation
}
