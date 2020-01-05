#[derive(Debug)]
pub struct ChessPosition (i32, i32);

#[derive(Debug)]
pub struct Queen {
    position: ChessPosition
}

impl ChessPosition {
    pub fn new(rank: i32, file: i32) -> Option<Self> {
        if rank >= 0 && rank < 8 && file >= 0 && file < 8 {
            Some(ChessPosition (rank, file))
        } else {
            None
        }
    }

    pub fn same_rank(&self, other: &ChessPosition) -> bool {
        self.0 == other.0
    }

    pub fn same_file(&self, other: &ChessPosition) -> bool {
        self.1 == other.1
    }

    pub fn same_diag(&self, other: &ChessPosition) -> bool {
        (self.0 - other.0).abs() == (self.1 - other.1).abs()
    }
}

impl Queen {
    pub fn new(position: ChessPosition) -> Self {
        Queen { position: position }
    }

    pub fn can_attack(&self, other: &Queen) -> bool {
        self.position.same_rank(&other.position)
        || self.position.same_file(&other.position)
        || self.position.same_diag(&other.position)
    }
}
